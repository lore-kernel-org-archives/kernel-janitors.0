From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 13 Apr 2004 22:33:26 +0000
Subject: Re: [Kernel-janitors] 2.6.5-kj1 merge status
Message-Id: <20040413153326.3619f67b.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53696925074110302=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040409090100.74e6940e.rddunlap@osdl.org>
In-Reply-To: <20040409090100.74e6940e.rddunlap@osdl.org>
To: kernel-janitors@vger.kernel.org

--===============53696925074110302==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Apr 2004 19:21:02 -0300 Luiz Fernando N. Capitulino wrote:

| Em Tue, 13 Apr 2004 14:36:29 -0700
| "Randy.Dunlap" <rddunlap@osdl.org> escreveu:
| 
| | | |  I was doing the "deugli" work for floppy98, can you run Lindent on it ?
| | | 
| | | Sure.
| | 
| | Nope, I have to retract that since I can't build it either before or
| | after making changes to it.  It looks like the (NEC) PC-9800 x86 sub-arch.
| | code changes are stagnating.  They don't build and there haven't been
| | any updates to them in quite a long time.
| | 
| | If any of you want a real challenge, contact the PC-9800 project
| | people and see if you can help them get the PC-9800 changes merged.
| | They are (were) at:  http://sourceforge.jp/projects/linux98/
| | 
| | NOTE:  you need to judge the priority of this kind of work on your own.
| | I'm not saying that it is high or low or medium priority, but it
| | is not trivial.
| 
|  Oh no... I does not have that hardware and don't want to get the
| project. Let's forget the floppy98 for now.
| 
|  In the last days I was fixing some warnings in -mm tree, but
| the trivial ones finished. Actually, the warnings which survive
| are the ones for check_region() (in OSS) and some SCSI drivers not
| ported.
| 
|  Are you too busy ? if yes, I can merge floppy_audit_v2.patch in
| the new floppy patch. Should I ?

Yes, you go ahead with that, please.

--
~Randy
"We have met the enemy and he is us."  -- Pogo (by Walt Kelly)
(Again.  Sometimes I think ln -s /usr/src/linux/.config .signature)

--===============53696925074110302==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53696925074110302==--
