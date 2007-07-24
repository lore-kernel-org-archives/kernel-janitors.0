From: Ravid Baruch Naali <ravid@codefidence.com>
Date: Tue, 24 Jul 2007 11:22:38 +0000
Subject: [KJ][PATCH]dev->mem_start default value (~0) test
Message-Id: <46A5E0FE.5000608@codefidence.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040808020408060408090806"
List-Id: <kernel-janitors.vger.kernel.org>
References: <46A5C2FE.6040602@codefidence.com>
In-Reply-To: <46A5C2FE.6040602@codefidence.com>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040808020408060408090806
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Trying to resend my patch hopefully the patch will be attached inline.
The attached patch covers all of the drivers/net directory adding the
dev->mem_start check for ~0

-- 
Ravid Baruch Naali
ravid@gmail.com
+972 4 6732729
+972 52 5830021



--------------040808020408060408090806
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--------------040808020408060408090806--
