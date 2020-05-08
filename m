From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 May 2020 08:49:41 +0000
Subject: Re: [PATCH] memory: tegra: Fix an error handling path in 'tegra186_emc_probe()'
Message-Id: <20200508084941.GE9365@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506200907.195502-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200506200907.195502-1-christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, May 06, 2020 at 10:09:07PM +0200, Christophe JAILLET wrote:
> @@ -237,7 +239,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>  			"failed to set rate range [%lu-%lu] for %pC\n",
>  			emc->debugfs.min_rate, emc->debugfs.max_rate,
>  			emc->clk);
> -		return err;
> +		goto err_put_bpmp;
>  	}
>  
>  	emc->debugfs.root = debugfs_create_dir("emc", NULL);

Not really related to this patch but the error handling on this
debugfs_create_dir() call is wrong.  It never returns NULL.  The error
should just be ignored.  It shouldn't try print a message when debugfs
is deliberately disabled.

As in the correct code looks like:

 
        emc->debugfs.root = debugfs_create_dir("emc", NULL);
-       if (!emc->debugfs.root) {
-               dev_err(&pdev->dev, "failed to create debugfs directory\n");
-               return 0;
-       }
-
        debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root,
                            emc, &tegra186_emc_debug_available_rates_fops);
        debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,

debugfs_create_file() will return an error pointer if debugfs_create_dir()
fails or if debugfs is disabled.  (It is a no-op).

regards,
dan carpenter
