From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 04 Dec 2019 11:32:04 +0000
Subject: Re: [PATCH] i2400m/USB: fix error return when rx_size is too large
Message-Id: <11a3e023-0b8d-ce2f-8fc0-567d0d3c1980@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191202174246.77305-1-colin.king@canonical.com>
 <20191202.131327.1991319206654704992.davem@davemloft.net>
In-Reply-To: <20191202.131327.1991319206654704992.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: inaky@linux.intel.com, linux-wimax@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/12/2019 21:13, David Miller wrote:
> From: Colin King <colin.king@canonical.com>
> Date: Mon,  2 Dec 2019 17:42:46 +0000
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently when the rx_size is too large the intended error
>> -EINVAL is not being returned as this is being assigned to
>> result rather than rx_skb. Fix this be setting rx_skb
>> to ERR_PTR(-EINVAL) so that the error is returned in rx_skb
>> as originally intended.
>>
>> Addresses-Coverity: ("Unused value")
>> Fixes: a8ebf98f5414 ("i2400m/USB: TX and RX path backends")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> This leaks rx_skb, the caller is supposed to clean up rx_skb
> by freeing it if this function doesn't transmit it successfully.
> 
Oops, yes. Ignore this fix.

Colin
