From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 30 May 2017 03:21:43 +0000
Subject: Re: [PATCH] Input: synaptics-rmi4 - change a char type to u8
Message-Id: <20170530032143.GG32841@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170503212319.frj4k66dzezlleey@mwanda>
In-Reply-To: <20170503212319.frj4k66dzezlleey@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nick Dyer <nick@shmanahar.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 04, 2017 at 12:23:19AM +0300, Dan Carpenter wrote:
> Smatch doesn't like when we use "%02X" to print char types because,
> what about if it's a negative?

Applied, thank you. Furthermore, I think we could reduce it to using %ph
instead of that loop.

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/input/rmi4/rmi_f34v7.c b/drivers/input/rmi4/rmi_f34v7.c
> index 10c0d11b72c9..ae2db1c3aebf 100644
> --- a/drivers/input/rmi4/rmi_f34v7.c
> +++ b/drivers/input/rmi4/rmi_f34v7.c
> @@ -518,7 +518,7 @@ static int rmi_f34v7_read_queries(struct f34_data *f34)
>  			query_1_7.partition_support[1] & HAS_GUEST_CODE;
>  
>  	if (query_0 & HAS_CONFIG_ID) {
> -		char f34_ctrl[CONFIG_ID_SIZE];
> +		u8 f34_ctrl[CONFIG_ID_SIZE];
>  		int i = 0;
>  		u8 *p = f34->configuration_id;
>  		*p = '\0';

Thanks.

-- 
Dmitry
