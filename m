From: "Dan Carpenter" <error27@gmail.com>
Date: Mon, 23 Oct 2006 18:01:36 +0000
Subject: Re: [KJ] [PATCH] Correct misc_register return code handling in
Message-Id: <a63d67fe0610231101v2f407e7dv46adaf8dbb0fb4e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061023171910.GA23714@hmsreliant.homelinux.net>
In-Reply-To: <20061023171910.GA23714@hmsreliant.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Horman <nhorman@tuxdriver.com>
Cc: kernel-janitors@lists.osdl.org, akpm@osdl.org, maxk@qualcomm.com, benh@kernel.crashing.org, linux-kernel@vger.kernel.org, kjhall@us.ibm.com

On 10/23/06, Neil Horman <nhorman@tuxdriver.com> wrote:
> +out3:
> +       for_each_online_node(node) {
> +               if(timers[node] != NULL)
> +                       kfree(timers[node]);
> +       }

Tharindu is going to be unhappy out if he sees that.  There is a
possibility that timers[node] is uninitialized.  if node[0] is null
then node[1] is uninitialized and it's going to cause a crash.

regards,
dan carpenter
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
