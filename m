From: Jody McIntyre <scjody@modernduck.com>
Date: Tue, 15 Feb 2005 00:20:49 +0000
Subject: [KJ] Re: [PATCH] 18/34: ieee1394/video1394: replace
Message-Id: <20050215002049.GH9231@conscoop.ottawa.on.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74211044366106726=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74211044366106726==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

/me finally gets time to review this...

This doesn't apply to anything I can find.  Patches against 1394 svn
( svn://svn.linux1394.org/libraw1394/ ) or development bk
( http://linux-1394.bkbits.net/1394-dev ) are most useful, but I can
deal with others.


On Tue, Jan 25, 2005 at 04:10:44PM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> I mistakenly sent to the wrong address for the list. Please reply in CC to
> bcollins@debian.org and kernel-janitors@lists.osdl.org. Thanks!
> 
> Please consider applying.
> 
> Description: Use wait_event_interruptible() instead of the deprecated
> interruptible_sleep_on(). The first change is simply to clean up the code a
> little to make it clearer. The second actually does a replacement, mimicking
> exactly the first. I removed the #if 1/#else/endif logic, as it duplicated the
> same code. Patch is compile-tested.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.11-rc2-kj-v/drivers/ieee1394/video1394.c	2005-01-24 09:34:07.000000000 -0800
> +++ 2.6.11-rc2-kj/drivers/ieee1394/video1394.c	2005-01-24 15:06:16.000000000 -0800
> @@ -964,10 +964,9 @@ static int __video1394_ioctl(struct file
>  				}
>  			}
>  #else
> -			if (wait_event_interruptible(d->waitq,
> -						     d->buffer_status[v.buffer]
> -						     == VIDEO1394_BUFFER_READY)
> -			    == -ERESTARTSYS)
> +			wait_event_interruptible(d->waitq,
> +					(d->buffer_status[v.buffer] == VIDEO1394_BUFFER_READY));
> +			if (signal_pending(current))
>  				return -EINTR;

Fine, but that only touches the #else of an #if 1 and leaves an
interruptible_sleep_on in the part that's actually executed.

Can you change this to be more like hunk 2?

For what it's worth, the #if 1 has been there since 2002 so it's
probably safe to remove by now :)

Thanks,
Jody

>  #endif
>  			d->buffer_status[v.buffer]=VIDEO1394_BUFFER_FREE;
> @@ -1126,19 +1125,10 @@ static int __video1394_ioctl(struct file
>  			d->buffer_status[v.buffer]=VIDEO1394_BUFFER_FREE;
>  			return 0;
>  		case VIDEO1394_BUFFER_QUEUED:
> -#if 1
> -			while (d->buffer_status[v.buffer]!=
> -			      VIDEO1394_BUFFER_READY) {
> -				interruptible_sleep_on(&d->waitq);
> -				if (signal_pending(current)) return -EINTR;
> -			}
> -#else
> -			if (wait_event_interruptible(d->waitq,
> -						     d->buffer_status[v.buffer]
> -						     == VIDEO1394_BUFFER_READY)
> -			    == -ERESTARTSYS)
> +			wait_event_interruptible(d->waitq,
> +					(d->buffer_status[v.buffer] == VIDEO1394_BUFFER_READY));
> +			if (signal_pending(current))
>  				return -EINTR;
> -#endif
>  			d->buffer_status[v.buffer]=VIDEO1394_BUFFER_FREE;
>  			return 0;
>  		default:
> 
> 
> -------------------------------------------------------
> This SF.Net email is sponsored by: IntelliVIEW -- Interactive Reporting
> Tool for open source databases. Create drag-&-drop reports. Save time
> by over 75%! Publish reports on the web. Export to DOC, XLS, RTF, etc.
> Download a FREE copy at http://www.intelliview.com/go/osdn_nl
> _______________________________________________
> mailing list linux1394-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux1394-devel

-- 

--===============74211044366106726==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74211044366106726==--
