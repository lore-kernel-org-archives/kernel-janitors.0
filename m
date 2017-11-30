From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 30 Nov 2017 14:30:25 +0000
Subject: Re: [PATCH] atm: lanai: use setup_timer instead of init_timer
Message-Id: <f2afc37a-a8a0-b83e-bacf-9f68c4e64322@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171124132712.31882-1-colin.king@canonical.com>
 <20171130.092337.1169504726284026440.davem@davemloft.net>
In-Reply-To: <20171130.092337.1169504726284026440.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: 3chas3@gmail.com, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 30/11/17 14:23, David Miller wrote:
> From: Colin King <colin.king@canonical.com>
> Date: Fri, 24 Nov 2017 13:27:12 +0000
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Use setup_timer function instead of initializing timer with the
>> function and data fields.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> setup_timer() = -ENOEXIST.
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Apologies. My bad.

Colin
