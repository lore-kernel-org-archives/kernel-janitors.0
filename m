From: David Miller <davem@davemloft.net>
Date: Tue, 13 Jul 2010 03:32:03 +0000
Subject: Re: [PATCH v2] depca: fix leaks in depca_module_init()
Message-Id: <20100712.203203.137829316.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278678986-7725-1-git-send-email-segooon@gmail.com>
	<20100711.181300.58435799.davem@davemloft.net>
	<20100712145233.GA30504@albatros>
In-Reply-To: <20100712145233.GA30504@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, jpirko@redhat.com, joe@perches.com, shemminger@vyatta.com, eric.dumazet@gmail.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 12 Jul 2010 18:52:33 +0400

> Since some of xxx_register_driver() can return error we must unregister
> already registered drivers.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
