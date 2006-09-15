From: "Dan Carpenter" <error27@gmail.com>
Date: Fri, 15 Sep 2006 04:15:17 +0000
Subject: Re: [KJ] while(1) fork() problem
Message-Id: <a63d67fe0609142115p46fcb2b0y6d80b109efc4122d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060915035812.39772.qmail@web55412.mail.re4.yahoo.com>
In-Reply-To: <20060915035812.39772.qmail@web55412.mail.re4.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 9/14/06, nikhil mishra <ls_niks@yahoo.com> wrote:
> hello concerned
> while(1)
> fork();
> why this code has a problem is quite understood .
> what can be the solution ?

Take a look at `man ulimit`.

regards,
dan carpenter
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
