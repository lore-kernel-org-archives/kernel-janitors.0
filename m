From: Felipe W Damasio <felipewd@terra.com.br>
Date: Thu, 23 Jun 2005 07:40:16 +0000
Subject: Re: [KJ] [PATCH] [RESEND] Audit return code : drivers/char/applicom.c
Message-Id: <42BA6760.6080004@terra.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622075313.GE5054@rhum.iomeda.fr>
In-Reply-To: <20050622075313.GE5054@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

    Hi Chistophe,

Christophe Lucas wrote:

>+out:
>+	for (i = 0 ; i < MAX_BOARD ; i++) {
>+		if (apbs[i].RamIO)
>+			continue;
>  
>

    I don't get this. Isn't it supposed to be:

    if (!apbs[i].RamIO)

    ?

    If you pass apps[i].RamIO to iounmap only when it's set to NULL
you'll always get a "__iounmap: bad address", right?

    Cheers,

Felipe Damasio
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
