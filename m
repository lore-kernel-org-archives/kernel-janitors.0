From: "David S. Miller" <davem@davemloft.net>
Date: Thu, 11 Nov 2004 22:54:20 +0000
Subject: Re: [KJ] [PATCH] driver/net/tg3.c: some s/int/unsigned int
Message-Id: <20041111145420.7c329c55.davem@davemloft.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61881742688097519=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041102101835.GA4083@voyager>
In-Reply-To: <20041102101835.GA4083@voyager>
To: kernel-janitors@vger.kernel.org

--===============61881742688097519==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 8 Nov 2004 09:07:26 +0100
Carlo Perassi <carlo@linux.it> wrote:

> > Please let me know if you'd like a new version without the "if"s or not.
> 
> this is the new version with the discussed changes

Carlo... please look at this carefully:

@@ -518,7 +519,8 @@ static int tg3_readphy(struct tg3 *tp, i
 static int tg3_writephy(struct tg3 *tp, int reg, u32 val)
 {
 	u32 frame_val;
-	int loops, ret;
+	int ret;
+	unsigned int loops;
 
 	if ((tp->mi_mode & MAC_MI_MODE_AUTO_POLL) != 0) {
 		tw32_f(MAC_MI_MODE,
@@ -595,7 +597,7 @@ static int tg3_bmcr_reset(struct tg3 *tp
 		}
 		udelay(10);
 	}
-	if (limit <= 0)
+	if (limit < 0)
 		return -EBUSY;

How can an "unsigned" value every be less than zero?
Didn't the compiler even warn you about this?

--===============61881742688097519==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61881742688097519==--
