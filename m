From: Jarek Poplawski <jarkao2@gmail.com>
Date: Tue, 07 Dec 2010 22:09:41 +0000
Subject: Re: [patch] econet: unlock on -EPERM path
Message-Id: <4CFEB0A5.8040506@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101207110138.GM10623@bicker> <4CFEAEC2.7080506@gmail.com>
In-Reply-To: <4CFEAEC2.7080506@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: netdev@vger.kernel.org, Phil Blundell <philb@gnu.org>, Eric Dumazet <eric.dumazet@gmail.com>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

Jarek Poplawski wrote:
> Dan Carpenter wrote:
>> We need to do a mutex_unlock() and a put_dev() before returning.
> 
> Good catch! Btw, isn't this put_dev() below, in case SIOCGIFADDR,
> superfluous?

Hmm... put_dev() a.k.a. dev_put() ;-)

Jarek P.
