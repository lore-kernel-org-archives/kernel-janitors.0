From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 10 Oct 2017 09:28:08 +0000
Subject: Re: ARM: SAMSUNG: Improve a size determination in 13 functions
Message-Id: <6d573f66-8735-f745-e0bd-27cc29880eb0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75c352ad-c51e-2e63-2f93-0f14522ff09c@users.sourceforge.net>
 <7f196313-ad49-2cd8-e45f-be487e089547@users.sourceforge.net>
 <20171004191102.mnswu25bjxynuh4o@kozik-lap>
In-Reply-To: <20171004191102.mnswu25bjxynuh4o@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-arm-kernel@lists.infradead.org

> Thanks, applied.

Is the chosen commit description “Simplify the size argument of kzalloc() memory allocation
by using …” really appropriate when calls were adjusted for further two function names
by this update suggestion?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id	e1cf829c45a2f030c7fd49533a86b0935d068a

Regards,
Markus
