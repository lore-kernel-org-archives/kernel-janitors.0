From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sat, 09 Jul 2005 00:11:27 +0000
Subject: [KJ] [PATCH 7/14] mips: replace timespectojiffies() with
Message-Id: <20050709001127.GM2596@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53977003805270396=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050709000324.GD2596@us.ibm.com>
In-Reply-To: <20050709000324.GD2596@us.ibm.com>
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org, Kernel-Janitors <kernel-janitors@lists.osdl.org>

--===============53977003805270396==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Nishanth Aravamudan <nacc@us.ibm.com>

Description: Replace custom timespectojiffies() function with generic
standard one.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

---

 irixsig.c |   14 +-------------
 1 files changed, 1 insertion(+), 13 deletions(-)

diff -urp 2.6.13-rc2-kj/arch/mips/kernel/irixsig.c 2.6.13-rc2-kj-dev/arch/mips/kernel/irixsig.c
--- 2.6.13-rc2-kj/arch/mips/kernel/irixsig.c	2005-07-06 07:57:02.000000000 -0700
+++ 2.6.13-rc2-kj-dev/arch/mips/kernel/irixsig.c	2005-07-06 13:30:34.000000000 -0700
@@ -441,18 +441,6 @@ struct irix5_siginfo {
 	} stuff;
 };
 
-static inline unsigned long timespectojiffies(struct timespec *value)
-{
-	unsigned long sec = (unsigned) value->tv_sec;
-	long nsec = value->tv_nsec;
-
-	if (sec > (LONG_MAX / HZ))
-		return LONG_MAX;
-	nsec += 1000000000L / HZ - 1;
-	nsec /= 1000000000L / HZ;
-	return HZ * sec + nsec;
-}
-
 asmlinkage int irix_sigpoll_sys(unsigned long *set, struct irix5_siginfo *info,
 				struct timespec *tp)
 {
@@ -490,7 +478,7 @@ asmlinkage int irix_sigpoll_sys(unsigned
 			error = -EINVAL;
 			goto out;
 		}
-		expire = timespectojiffies(tp)+(tp->tv_sec||tp->tv_nsec);
+		expire = timespec_to_jiffies(tp)+(tp->tv_sec||tp->tv_nsec);
 	}
 
 	while(1) {

--===============53977003805270396==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53977003805270396==--
