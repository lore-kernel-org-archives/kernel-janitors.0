From: Jarek Poplawski <jarkao2@gmail.com>
Date: Tue, 07 Dec 2010 22:01:38 +0000
Subject: Re: [patch] econet: unlock on -EPERM path
Message-Id: <4CFEAEC2.7080506@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101207110138.GM10623@bicker>
In-Reply-To: <20101207110138.GM10623@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: netdev@vger.kernel.org, Phil Blundell <philb@gnu.org>, Eric Dumazet <eric.dumazet@gmail.com>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

Dan Carpenter wrote:
> We need to do a mutex_unlock() and a put_dev() before returning.

Good catch! Btw, isn't this put_dev() below, in case SIOCGIFADDR,
superfluous?

Jarek P.
