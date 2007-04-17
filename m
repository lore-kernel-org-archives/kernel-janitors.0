From: "Chris Miller" <lordsauronthegreat@gmail.com>
Date: Tue, 17 Apr 2007 05:24:33 +0000
Subject: Re: [KJ] [PATCH]sch_atm.c-kzalloc
Message-Id: <e5a3e9ac0704162224l263d2c88n2c7d251f21d10364@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1176703544.13066.13.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1176703544.13066.13.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4/16/07, vignesh.babu@wipro.com <vignesh.babu@wipro.com> wrote:
> kzalloc performs a kmalloc and if the allocation is successful it
> continues to perform a memset 0.

Ah, okay. :)

-- 
It's not much, but it's what I call 127.0.0.1
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
