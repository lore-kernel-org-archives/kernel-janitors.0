From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Thu, 23 Feb 2006 23:58:06 +0000
Subject: Re: [KJ] How to send a patch
Message-Id: <9a8748490602231558s1ad26264v8449d037420edd46@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140732815.12049.15.camel@alice>
In-Reply-To: <1140732815.12049.15.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/23/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> hi,
>
> i have a few other patches to switch the rest of fs/ to
> kzalloc() usage, and I am wondering how to send it.
> Since there is always only one file touched in the
> subdirectories, so i guess sending them each individually
> would be too much overhead.
>

Patches don't need to be split pr file.

If you are doing the same change it's perfectly fine to do a lot of
different files in one patch - as long as the patch makes one simple
change across all files there's no problem there.

In case there are *many* files involved (or if they cover a lot of
different areas) then it often makes sense to split pr top level
directory, like one patch for arch/ one for drivers/ one mm/ etc. or
if updating a lot of drivers you could do one for  drivers/scsi/ , one
for drivers/char/ etc etc.

Just use common sense :)


Quoting section 3 of Documentation/SubmittingPatches
(http://sosdg.org/~coywolf/lxr/source/Documentation/SubmittingPatches)
:

"
 3) Separate your changes.

 Separate _logical changes_ into a single patch file.

 For example, if your changes include both bug fixes and performance
 enhancements for a single driver, separate those changes into two
 or more patches.  If your changes include an API update, and a new
 driver which uses that new API, separate those into two patches.

 On the other hand, if you make a single change to numerous files,
 group those changes into a single patch.  Thus a single logical change
 is contained within a single patch.

 If one patch depends on another patch in order for a change to be
 complete, that is OK.  Simply note "this patch depends on patch X"
 in your patch description.

 If you cannot condense your patch set into a smaller set of patches,
 then only post say 15 or so at a time and wait for review and integration.
"


Also read Documentation/HOWTO
(http://sosdg.org/~coywolf/lxr/source/Documentation/HOWTO) for more
good info.


--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
