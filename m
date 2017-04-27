From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Thu, 27 Apr 2017 21:58:41 +0000
Subject: Re: [PATCH] staging: speakup: Replace simple_strtoul by kstrtoul
Message-Id: <20170427215841.rbiiu5tzkrxhqefx@var.youpi.perso.aquilenet.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170427164032.GA1578@gmail.com>
In-Reply-To: <20170427164032.GA1578@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Shekhar Bhandakkar, on jeu. 27 avril 2017 22:10:32 +0530, wrote:
> The simple_strtoul function is obsolete.
> This patch replaces it by kstrtoul.

> @@ -153,7 +154,9 @@ static ssize_t chars_chartab_store(struct kobject *kobj,
>  			continue;
>  		}
>  
> -		index = simple_strtoul(cp, &temp, 10);
> +		err = kstrtoul(cp, 10, &index);

Again, that doesn't update the temp pointer, which is used below.
So really NACK from me.

Samuel
