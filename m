From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 01 Nov 2004 19:18:30 +0000
Subject: [KJ] [PATCH] Add ssleep_interruptible()
Message-Id: <20041101200749.GF1730@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============028694023463083695=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <E1CO1vc-00022t-N2@sputnik>
In-Reply-To: <E1CO1vc-00022t-N2@sputnik>
To: janitor@sternwelten.at
Cc: netdev@oss.sgi.com, jgarzik@pobox.com, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

--===============028694023463083695==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Description: Adds ssleep_interruptible() to allow longer delays to occur
in TASK_INTERRUPTIBLE, similarly to ssleep(). To be consistent with
msleep_interruptible(), ssleep_interruptible() returns the remaining time
left in the delay in terms of seconds. This required dividing the return
value of msleep_interruptible() by 1000, thus a cast to (unsigned long)
to prevent any floating point issues.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.10-rc1-vanilla/include/linux/delay.h	2004-10-30 15:34:03.000000000 -0700
+++ 2.6.10-rc1/include/linux/delay.h	2004-11-01 12:06:11.000000000 -0800
@@ -46,4 +46,9 @@ static inline void ssleep(unsigned int s
 	msleep(seconds * 1000);
 }
 
+static inline unsigned long ssleep_interruptible(unsigned int seconds)
+{
+	return (unsigned long)(msleep_interruptible(seconds * 1000) / 1000);
+}
+
 #endif /* defined(_LINUX_DELAY_H) */

--===============028694023463083695==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============028694023463083695==--
