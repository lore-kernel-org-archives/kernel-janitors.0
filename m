From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 25 Feb 2004 20:38:49 +0000
Subject: Re: [Kernel-janitors] [PATCH] - 2.6.2 -scripts/modpost.c -
Message-Id: <20040225123849.62884aa0.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402142246.32092.ron@rongage.org>
In-Reply-To: <200402142246.32092.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 14 Feb 2004 22:46:32 -0500 Ron Gage wrote:

| Fixes signed/unsigned comparison warnings.
| 

This one (modpost) is OK.  The other 2 still left some comparison
warnings for me, using gcc 3.2.  What compiler version did you use
to test these changes?

--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
