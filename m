From: Michael Still <mikal@stillhq.com>
Date: Tue, 20 Apr 2004 07:44:19 +0000
Subject: Re: [Kernel-janitors] [RFT] Update to the mandocs build target
Message-Id: <4084D4D3.8020304@stillhq.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0369596118260338=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40831B29.9010108@stillhq.com>
In-Reply-To: <40831B29.9010108@stillhq.com>
To: kernel-janitors@vger.kernel.org

--===============0369596118260338==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Randy.Dunlap wrote:

> Hi,

Hello

> I'll share my experiences and comments on this patch.

Thanks...

> 1.  Before applying this patch, if I did 'make mandocs', I had
> 21 empty (0-length) man files generated.[1]
> They don't appear when using this patch (at least not yet, but
> it hasn't finished yet either -- that's #2.).

See my comments below (after your list of files).

> 2.  'make mandocs' has now been running for about 1/2 hour.
> I hope it finishes soon.  :)
> ... well, about 1 hour and still going (dual-proc P4, 1.7 GHz,
> 1 GB RAM).

# make clean
# time make mandocs
...output...

real    40m28.109s
user    30m24.941s
sys     3m48.073s

(That's a Pentium=M 1.3 GHz, with a 4200 RPM disc).

I would expect the target to be IO bound. Was the disc system on the box 
busy at the same time? In a nutshell, the old build target built all of 
the sgmldocs in the Documentation/DocBook directory, and then extracted 
the manual pages from there. I went away from this approach as many (ie 
most) kernel-doc comments in the source code never make it into the sgml 
files in Documentation/DocBook. Instead, the new patch does something 
along the lines of:

find . -type f -name "*.[cChHsS]" -exec ...extract comments... \;

Which takes a while. It then converts all the stuff it found into manual 
pages, which itself takes longer than before because there are a _lot_ 
of manual pages now -- 4033 to be precise.

I don't like the find approach, but I couldn't think of a better way to 
find all of the comments. My attitude is that the build target will be 
infrequently used, and if someone went to the trouble to put the comment 
into the source code, then it deserves to be a manual page as well. If 
the build time is a big problem, then hopefully distributions will 
simply ship the output of the generation step with their kernel packages.

> 3.  I have a man page/file named 'man/if.9.gz'.  Some 'if' statement
> got picked up from somewhere.  Sometimes it is nice to include
> a line about the file that an API was found in (even without
> having found this odd one).

Yes. I hadn't thought of that. The previous version of mandocs copied 
the copyright statement from the sgml file into the manpage as a 
comment, but the new version can't do this as it doesn't know what (if 
any) sgml file the comment is used in. I'll work on a tweaked version ASAP.

The comment extraction is done with a patched version of the original 
kernel-doc, so you've probably found a bug with that. I will look into it.

Another interesting problem is that of repeated comments. There are 
places where more than one comment documents a function of a given name. 
At the moment the last found comment wins. Ultimately it would be nice 
to audit those comments, and work out why there are repeats (multiple 
architectures repeating code?).

> [1]:
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 deviceiobook.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 14:07 gadget.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 14:05 journal-api.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:59 kernel-api.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 kernel-hacking.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 kernel-locking.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 14:07 libata.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 14:06 lsm.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:57 mcabook.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 mousedrivers.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:57 parportbook.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 procfs-guide.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 scsidrivers.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 sis900.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 tulip-user.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 14:06 usb.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 via-audio.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:57 videobook.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:57 wanbook.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 writing_usb_driver.9
> -rw-r--r--    1 rddunlap staff           0 Apr 19 13:57 z8530book.9

I have no manual pages of zero length with the new patch.

Mikal

-- 

Michael Still (mikal@stillhq.com) | "All my life I've had one dream,
http://www.stillhq.com            |  to achieve my many goals"
UTC + 11                          |    -- Homer Simpson

--===============0369596118260338==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0369596118260338==--
