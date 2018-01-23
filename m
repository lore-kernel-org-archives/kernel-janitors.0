From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Tue, 23 Jan 2018 21:55:19 +0000
Subject: Re: [PATCH-next] misc: mic: Use PTR_ERR_OR_ZERO
Message-Id: <20180123215519.GP13338@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180123201009.12998-1-chrisadr@gentoo.org>
In-Reply-To: <20180123201009.12998-1-chrisadr@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christopher =?iso-8859-1?Q?D=EDaz?= Riveros <chrisadr@gentoo.org>
Cc: sudeep.dutt@intel.com, ashutosh.dixit@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 23, 2018 at 03:10:09PM -0500, Christopher D=EDaz Riveros wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>=20
> This issue was detected by using the Coccinelle software.

... and that's a wonderful demonstration of the reasons why PTR_ERR_OR_ZERO=
()
is in bad taste.

Look at the callers of that sucker:

        err =3D scif_anon_inode_getfile(ep);
        if (err)
                goto err_anon_inode;

and

        err =3D scif_anon_inode_getfile(cep);
        if (err)
                goto scif_accept_error_anon_inode;

See the problem?  What really happens here is that we
	* call anon_inode_getfile() and stick the result into ->anon.
	* if that was ERR_PTR(), we bugger off

Checking that PTR_ERR_OR_ZERO() is non-zero is a bloody convoluted way of
spelling
	if (IS_ERR(...)) {
		err =3D PTR_ERR(...);
		goto sod_off;
	}

Your change preserves the ugliness of the original calling conventions;
the mistake here is making it return an int.  Add the fact that
all (both) callers are in drivers/misc/mic/scif/scif_api.c and take
a look at this:
; git grep -n -w scif_anon_fops
drivers/misc/mic/scif/scif_api.c:47:const struct file_operations scif_anon_=
fops =3D {
drivers/misc/mic/scif/scif_epd.h:167:   epd->anon =3D anon_inode_getfile("s=
cif", &scif_anon_fops, NULL, 0);
drivers/misc/mic/scif/scif_main.h:213:extern const struct file_operations s=
cif_anon_fops;
;

So scif_anon_fops is
	* defined in scif_api.c
	* declared in scif_main.h
	* used only in an inline function defined in scif_epd.h, which is used
only in scif_api.c

Could you spell "way too convoluted"?

Please, do the following: move that sucker scif_api.c, and make it return
struct file *.  As in return epd->anon =3D anon_inode_getfile(...);
And turn the callers into
	if (IS_ERR(whatever_you_call_it(ep))) {
		err =3D PTR_ERR(ep->anon);
		goto ...;
	}
Then make scif_anon_fops static and kill that extern in scif_main.h.

<looks at that thing>  What the hell?  <greps>  <swears>  <greps
for callers of scif_poll()> <swears more>

Let me see if I got it right - *ALL* callers of that thing pass it
an array consisting of 1 (one) entry.  So playing with poll_wqueues
and __pollwait() is utterly pointless in scif_poll().  So is grabbing
references to that struct file, BTW, regardless of everything else.
And so is having the bloody ->anon at all - __scif_pollfd() should be
passed NULL as the first argument and that's it.  All it takes is
a separate queue callback set via init_poll_funcptr() and to hell
with all those complication.  Oh, and since we don't really need
dynmic allocations inside that queue callback, table.error crap
also goes to hell...

Incidentally, since this is one of the two places outside of fs/select.c
using poll_{init,free}wait(), we can bloody well unexport those - the
other caller (in drivers/staging/farce^Wcomedi) also uses it for
single struct file, pinned by the caller.  And while we are at it,
that would also make struct poll_wqueues private to fs/select.c...

Could Intel folks describe the planned future uses of scif_poll()?
If it's not going to be used for large sets, the whole thing could
be simplified quite nicely...
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
