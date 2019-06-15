From: David Miller <davem@davemloft.net>
Date: Sat, 15 Jun 2019 20:38:51 +0000
Subject: Re: [PATCH net-next] hinic: Use devm_kasprintf instead of hard coding it
Message-Id: <20190615.133851.553488737561865526.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613195412.1702-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190613195412.1702-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: aviad.krawczyk@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 13 Jun 2019 21:54:12 +0200

> 'devm_kasprintf' is less verbose than:
>    snprintf(NULL, 0, ...);
>    devm_kzalloc(...);
>    sprintf
> so use it instead.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
