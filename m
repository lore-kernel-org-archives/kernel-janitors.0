From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Tue, 04 Jul 2017 17:13:10 +0000
Subject: Re: [PATCH][-next] mqueue: fix incorrect memset size for object v
Message-Id: <20170704171310.GW10672@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170704160919.19406-1-colin.king@canonical.com>
In-Reply-To: <20170704160919.19406-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@kernel.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Steven Whitehouse <swhiteho@redhat.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Waiman Long <longman@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 04, 2017 at 05:09:19PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The size of the memset is incorrect, it is currently using the size
> of attr (a struct mq_attr *) and not of v (a struct compat_mq_attr)

Folded (and that was a moderate infoleak - ->__reserved[] thing had
been copied out uninitialized).
