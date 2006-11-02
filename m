From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Thu, 02 Nov 2006 00:05:49 +0000
Subject: Re: [KJ] [PATCH] Correct misc_register return code handling in
Message-Id: <9a8748490611011605u55ccdcaeob99700d6e1a813a4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061023171910.GA23714@hmsreliant.homelinux.net>
	 <1161660875.10524.535.camel@localhost.localdomain>
	 <20061024125306.GA1608@hmsreliant.homelinux.net>
	 <1161729762.10524.660.camel@localhost.localdomain>
	 <20061101135619.GA3459@hmsreliant.homelinux.net>
In-Reply-To: <20061101135619.GA3459@hmsreliant.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Horman <nhorman@tuxdriver.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, akpm@osdl.org, kernel-janitors@lists.osdl.org, kjhall@us.ibm.com, maxk@qualcomm.com, linux-kernel@vger.kernel.org

On 01/11/06, Neil Horman <nhorman@tuxdriver.com> wrote:
> Hey all-
>         Since Andrew hasn't incorporated this patch yet, and I had the time, I
> redid the patch taking Benjamin's INIT_LIST_HEAD and Joes mmtimer cleanup into
> account.  New patch attached, replacing the old one, everything except the
> aforementioned cleanups is identical.
>
> Thanks & Regards
> Neil
>
> Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
>
> +out4:
> +       for_each_online_node(node) {
> +               kfree(timers[node]);
> +       }
> +out3:
> +       misc_deregister(&mmtimer_miscdev);
> +out2:
> +       free_irq(SGI_MMTIMER_VECTOR, NULL);
> +out1:
> +       return -1;

Very nitpicky little thing, but shouldn't the labels start at column
1, not column 0 ?
I thought that was standard practice (apparently labels at column 0
can confuse 'patch').

Hmm, I guess that should be defined once and for all in
Documentation/CodingStyle

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
