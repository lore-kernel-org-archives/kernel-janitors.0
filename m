From: Marek Lindner <lindner_marek@yahoo.de>
Date: Mon, 29 Mar 2010 07:12:23 +0000
Subject: Re: [patch v2] batman: cleanup: change test for end of array
Message-Id: <201003291512.23606.lindner_marek@yahoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100328131335.GY5069@bicker>
In-Reply-To: <20100328131335.GY5069@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sunday 28 March 2010 21:13:35 Dan Carpenter wrote:
> @@ -43,10 +43,7 @@ static struct device_client *device_client_hash[256];
> 
> -	for (i = 0; i < 256; i++)
> -		device_client_hash[i] = NULL;
> +	memset(&device_client_hash, 0, sizeof(device_client_hash));

I might be mistaken but it looks like the "&" is wrong here. Shouldn't it be:
memset(device_client_hash, 0, sizeof(device_client_hash));

Cheers,
Marek
