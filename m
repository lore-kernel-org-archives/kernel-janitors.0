From: Michal Hocko <mhocko@suse.cz>
Date: Tue, 18 Oct 2011 21:29:32 +0000
Subject: Re: [patch] memory hotplug: release lock on an error path
Message-Id: <20111018212931.GB10656@tiehlicka.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111005055326.GA32187@elgon.mountain>
In-Reply-To: <20111005055326.GA32187@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nathan Fontenot <nfont@austin.ibm.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org

On Wed 05-10-11 08:53:26, Dan Carpenter wrote:
> We need to release the mutex here before returning.

Which kernel have you used as a base? I do not see any code like that in
the vanilla kernel. And git log doesn't know anything about
check_page_reservations in the file as well...

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index ca8bfe5..164c8a2 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -299,7 +299,7 @@ static int memory_block_change_state(struct memory_block *mem,
>  		for (i = 0; i < sections_per_block; i++) {
>  			ret = check_page_reservations(mem->start_section_nr + i);
>  			if (ret)
> -				return ret;
> +				goto out;
>  		}
>  	}
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

-- 
Michal Hocko
SUSE Labs
SUSE LINUX s.r.o.
Lihovarska 1060/12
190 00 Praha 9    
Czech Republic
