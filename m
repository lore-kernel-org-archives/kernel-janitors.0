From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 19 Apr 2004 22:23:10 +0000
Subject: Re: [Kernel-janitors] [RFT] Update to the mandocs build target
Message-Id: <20040419152310.0dfac8c1.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33893162003479405=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40831B29.9010108@stillhq.com>
In-Reply-To: <40831B29.9010108@stillhq.com>
To: kernel-janitors@vger.kernel.org

--===============33893162003479405==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Apr 2004 10:19:53 +1000 Michael Still wrote:

| 
| Heya,
| 
| a while ago I whipped up a mandocs build target for 2.6 which is now 
| included with the default kernel. The attached patch updates this build 
| target to more exhaustively identify potential man pages. This makes the 
| build of this target a little slower than before, but gives you a _lot_ 
| more manpages.
| 
| I'm interested in some people applying the patch to the latest kernel, 
| and letting me know if it works for them before I unleash it upon the 
| masses.

Hi,
I'll share my experiences and comments on this patch.

1.  Before applying this patch, if I did 'make mandocs', I had
21 empty (0-length) man files generated.[1]
They don't appear when using this patch (at least not yet, but
it hasn't finished yet either -- that's #2.).

2.  'make mandocs' has now been running for about 1/2 hour.
I hope it finishes soon.  :)
... well, about 1 hour and still going (dual-proc P4, 1.7 GHz,
1 GB RAM).

3.  I have a man page/file named 'man/if.9.gz'.  Some 'if' statement
got picked up from somewhere.  Sometimes it is nice to include
a line about the file that an API was found in (even without
having found this odd one).


--
~Randy
"We have met the enemy and he is us."  -- Pogo (by Walt Kelly)
(Again.  Sometimes I think ln -s /usr/src/linux/.config .signature)


[1]:
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 deviceiobook.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 14:07 gadget.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 14:05 journal-api.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:59 kernel-api.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 kernel-hacking.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 kernel-locking.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 14:07 libata.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 14:06 lsm.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:57 mcabook.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 mousedrivers.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:57 parportbook.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 procfs-guide.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 scsidrivers.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 sis900.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 tulip-user.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 14:06 usb.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 via-audio.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:57 videobook.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:57 wanbook.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:58 writing_usb_driver.9
-rw-r--r--    1 rddunlap staff           0 Apr 19 13:57 z8530book.9

--===============33893162003479405==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33893162003479405==--
