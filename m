From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Date: Sun, 16 Jul 2017 16:55:14 +0000
Subject: Re: [PATCH 0/2 v2] leds: tlc591xx: add missing of_node_put
Message-Id: <a0ee66e6-3242-b057-c9ce-c192cffe55e8@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1500112699-770-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1500112699-770-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Richard Purdie <rpurdie@rpsys.net>
Cc: kernel-janitors@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

Thanks for the patch set.

On 07/15/2017 11:58 AM, Julia Lawall wrote:
> This series first merges two conditionals and then adds of_node_put on
> jumping out of for_each_child_of_node.
> 
> v2 adds the merge of conditionals, resulting in fewer of_node_put calls.

Applied to the for-next branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
