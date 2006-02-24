From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Fri, 24 Feb 2006 00:05:58 +0000
Subject: Re: [KJ] How to send a patch
Message-Id: <1140739558.14056.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44251455620144425=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140732815.12049.15.camel@alice>
In-Reply-To: <1140732815.12049.15.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============44251455620144425==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-02-24 at 00:58 +0100, Jesper Juhl wrote:
> On 2/23/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> > hi,
> >
> > i have a few other patches to switch the rest of fs/ to
> > kzalloc() usage, and I am wondering how to send it.
> > Since there is always only one file touched in the
> > subdirectories, so i guess sending them each individually
> > would be too much overhead.
> >
> 
> Patches don't need to be split pr file.
> 
> If you are doing the same change it's perfectly fine to do a lot of
> different files in one patch - as long as the patch makes one simple
> change across all files there's no problem there.
> 
> In case there are *many* files involved (or if they cover a lot of
> different areas) then it often makes sense to split pr top level
> directory, like one patch for arch/ one for drivers/ one mm/ etc. or
> if updating a lot of drivers you could do one for  drivers/scsi/ , one
> for drivers/char/ etc etc.
> 
> Just use common sense :)

i tried and failed :-) The problem i have is that it would make sense to
send one patch, since it is a subsystem on one hand, but on the other
hand each filesystem has its own maintainer, which would be nice to have
on the cc list for the stuff he maintains. Putting all of them to the cc
list of the large patch gives them a lot of stuff they are not
interested in.

Thanks for the comments, Eric


--===============44251455620144425==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44251455620144425==--
