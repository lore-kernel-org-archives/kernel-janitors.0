From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:51 +0000
Subject: [KJ] [PATCH][RESUBMIT][0/21]  compile warning cleanup
Message-Id: <42113C2B.13655.52B883@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82785085053103979=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82785085053103979==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Hello all,

After taking into consideration all of the fine feedback I received from 
my first ever attempt at submitting a series of patches, I am now 
applying this feedback and am submitting patches that will hopefully pass 
the test and be applied.

I am resubmitting the entire series, even those that did not receive any 
feedback at all and are unchanged, since I received no notification that 
they were to be applied.

I have created these patches against the linux-2.6.11-rc3-mm2 tree since, 
while I am aware of the 2.6.11-rc4 patch, there is no corresponding patch 
for the -mm tree.  Is this the right way to go?  If not, please advise 
and I'll resubmit yet again.

Please note my solution (patch #17 in this series) to the unused table 
structures in some poorly written drivers that always assume that they 
will be compiled as modules.  I changed include/linux/modules.h to create 
an alias to remove the warning.  This works for all the compilation.  The 
advantages to this patch are 1:, that it removes the warnings, and 2:, 
the source files themselves do not have to be changed because of this 
problem.  The disadvantages are 1:, it removes the warning so a module 
writer will not be apprised of the fact that there is a minor problem, 
and 2, it pollutes the global name space. The patch also keeps the same 
status as before with the warning, that is, it still compiles the table 
into the code, so the kernel will drag around this unused data.



--===============82785085053103979==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82785085053103979==--
