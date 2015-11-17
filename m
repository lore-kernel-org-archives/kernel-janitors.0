From: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 17 Nov 2015 18:34:07 +0000
Subject: Re: [PATCH 1/7] phy: brcmstb-sata: add missing of_node_put
Message-Id: <20151117183407.GG8456@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447673600-8881-1-git-send-email-Julia.Lawall@lip6.fr>
 <1447673600-8881-2-git-send-email-Julia.Lawall@lip6.fr>
 <20151117013830.GV8456@google.com>
 <alpine.DEB.2.02.1511170711340.2045@localhost6.localdomain6>
 <20151117174430.GA8456@google.com>
 <alpine.DEB.2.10.1511171846120.2455@hadrien>
 <20151117183036.GF8456@google.com>
In-Reply-To: <20151117183036.GF8456@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Tue, Nov 17, 2015 at 10:30:36AM -0800, Brian Norris wrote:
> I expect the same sort of problem shows up plenty of other places. I
> don't think many people use CONFIG_OF_DYNAMIC, so the effects of these
> failures probably aren't felt by many.

Also, there's a quite-relevant todo item in
Documentation/devicetree/todo.txt:

== CONFIG_OF_DYNAMIC =...
- Document node lifecycle for CONFIG_OF_DYNAMIC

:)

Brian
