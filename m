From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 17:36:32 +0000
Subject: [KJ] [PATCH 19/34]: include/jiffies: add usecs_to_jiffies() function
Message-Id: <20050126173632.GA2758@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59600543342798917=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125233750.GI12649@us.ibm.com> <20050125185100.64d5c935.akpm@osdl.org>
In-Reply-To: <20050125185100.64d5c935.akpm@osdl.org>
To: Andrew Morton <akpm@osdl.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

--===============59600543342798917==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 25, 2005 at 06:51:00PM -0800, Andrew Morton wrote:
> Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> >
> > Please consider applying.
> > 
> >  Description: Add a usecs_to_jiffies() function.
> 
> Please cc linux-kernel on things which aren't utterly trivial?

Sorry, Andrew, I actually meant to, but forgot to change the CC line. Sorry for
the noise directly to you.

-Nish

Description: Add a usecs_to_jiffies() function. This will be used in one of my
subsequent patches. With the potential for dynamic HZ values much higher than
1000, we may need to consider times as small as usecs in terms of jiffies.
We have msecs_to_jiffies(), jiffies_to_msecs() and jiffies_to_usecs(), but no
usecs_to_jiffies(). Please check my math.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/include/linux/jiffies.h	2005-01-24 09:34:19.000000000 -0800
+++ 2.6.11-rc2-kj/include/linux/jiffies.h	2005-01-25 13:01:56.000000000 -0800
@@ -287,6 +287,19 @@ static inline unsigned long msecs_to_jif
 #endif
 }
 
+static inline unsigned long usecs_to_jiffies(const unsigned int u)
+{
+	if (u > jiffies_to_usecs(MAX_JIFFY_OFFSET))
+		return MAX_JIFFY_OFFSET;
+#if HZ <= 1000 && !(1000 % HZ)
+	return (u + (1000000 / HZ) - 1000) / (1000000 / HZ);
+#elif HZ > 1000 && !(HZ % 1000)
+	return u * (HZ / 1000000);
+#else
+	return (u * HZ + 999999) / 1000000;
+#endif
+}
+
 /*
  * The TICK_NSEC - 1 rounds up the value to the next resolution.  Note
  * that a remainder subtract here would not do the right thing as the

--===============59600543342798917==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59600543342798917==--
