From: MJK <mkemp@cs.nmsu.edu>
Date: Sun, 02 May 2004 12:54:18 +0000
Subject: [Kernel-janitors] INIT_WORK question
Message-Id: <Pine.LNX.4.58.0405020651340.1291@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72092539646219755=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============72092539646219755==
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hey,

	I am looking at some code that uses workqueues and am wondering
about something. We have INIT_WORK(work, func, data). If, in func, we
start to create some kernel_threads and the threads cannot be created for
some reason, do we then just ignore any return values and let the queue
"die out" or do we explicitly return after we check the return value of
kernel_thread?

Cordially,
MJK

--===============72092539646219755==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72092539646219755==--
