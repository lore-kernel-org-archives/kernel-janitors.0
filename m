From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Apr 2019 08:50:33 +0000
Subject: Re: [1/5] powerpc/sparse: fix possible object reference leak
Message-Id: <25ecfd6e-5dc8-a8d1-fe22-5de49136c956@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1553223955-7350-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1553223955-7350-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org

> @@ -131,7 +131,7 @@  static int drc_index_to_cpu(u32 drc_index)
>
>  			of_read_drc_info_cell(&info, &value, &drc);
>  			if (strncmp(drc.drc_type, "CPU", 3))
> -				goto err;
> +				goto err_of_node_put;
>
>  			if (drc_index > drc.last_drc_index) {

Can the jump label “put_node” be nicer here?

Regards,
Markus
