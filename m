From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Wed, 04 May 2005 16:33:25 +0000
Subject: Re: [KJ] [PATCH] drivers/char/selection.c: replace direct assignment
Message-Id: <29495f1d0505040933696e9616@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050504100438.GW8647@rhum.iomeda.fr>
In-Reply-To: <20050504100438.GW8647@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/4/05, Christophe Lucas <clucas@rotomalug.org> wrote:
> description:
> Use set_current_state() instead of direct assignment of
> current->state.

Usually, when you are setting the state to TASK_RUNNING, you don't
want to use set_current_state(), but __set_current_state(). The best
bet is to see if you can't convert the wait-queue usage in that
function to prepare_to_wait()/finish_wait().

Good luck,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
