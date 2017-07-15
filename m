From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 15 Jul 2017 09:58:17 +0000
Subject: [PATCH 0/2 v2] leds: tlc591xx: add missing of_node_put
Message-Id: <1500112699-770-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Purdie <rpurdie@rpsys.net>
Cc: kernel-janitors@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

This series first merges two conditionals and then adds of_node_put on
jumping out of for_each_child_of_node.

v2 adds the merge of conditionals, resulting in fewer of_node_put calls.
