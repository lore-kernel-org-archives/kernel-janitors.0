From: "Bob Copeland" <me@bobcopeland.com>
Date: Mon, 01 Dec 2008 21:04:25 +0000
Subject: Re: [PATCH] udf: fix sparse warnings
Message-Id: <b6c5339f0812011304h15eade93kada95b6616a2ddd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <493049b5.170e660a.26c3.ffff8fd8@mx.google.com>
	 <20081201120951.GD17303@duck.suse.cz>
In-Reply-To: <20081201120951.GD17303@duck.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Hannes Eder <hannes@hanneseder.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org

On Mon, Dec 1, 2008 at 7:09 AM, Jan Kara <jack@suse.cz> wrote:
> From f3facf9a4a60bba9f1fa0c779fc441c6aff90eb4 Mon Sep 17 00:00:00 2001
> From: Jan Kara <jack@suse.cz>
> Date: Mon, 1 Dec 2008 13:06:10 +0100
> Subject: [PATCH] udf: fix sparse warnings:
[...]
> -       } else {
> -               return;
> +               udf_table_free_blocks(sb, inode, map->s_fspace.s_table,
> +                                     bloc, offset, count);
>        }
> +       return;
>  }

Harmless, but in this case you don't need the return at all.

-- 
Bob Copeland %% www.bobcopeland.com
