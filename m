From: "Shakthi Kannan" <shakthimaan@gmail.com>
Date: Fri, 25 Aug 2006 08:09:18 +0000
Subject: Re: [KJ] [PATCH] all files: init, cleanup to module init/exit
Message-Id: <d16b1c80608250057v1a6f67d4v45966c06191f17ea@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
In-Reply-To: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Raseel and others,

On 8/23/06, Raseel Bhagat <raseelbhagat@gmail.com> wrote:
> You have a typo on the above line :
> correction :
> static int __init sparc_misc_init(void)

Oops. Sorry about that. Do I resend the entire fixed patch?

Is there anything that need to be done with the module_init between
ifdef MODULEs, or is that ok?

Thanks,

SK

-- 
Shakthi Kannan
http://www.shakthimaan.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
