From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 10 Jan 2007 19:44:20 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <20070110194420.GA4997@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 10, 2007 at 07:29:43PM +0100, Martin Olsen wrote:
> @@ -0,0 +1,54 @@
> +/*
> + * linux/include/power_of_2.h - Power of 2 helper functions.
> + *
> + * Copyright (C) 2006 Martin Olsen <triplefault@gmail.com>
> + *
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 
> + * USA
> + *
> + */
> +#ifndef _LINUX_POWER_OF_2_H
> +#define _LINUX_POWER_OF_2_H
> +
> +#include <linux/types.h>
> +
> +static inline bool is_power_of_2_or_zero(unsigned long i)
> +{
> +	return (i & (i - 1)) = 0;
> +}
> +
> +static inline bool is_power_of_2(unsigned long i)
> +{
> +	return i && is_power_of_2_or_zero(i);
> +}
> +
> +static inline unsigned long round_up_to_power_of_2(unsigned long i)
> +{
> +	while ((i & (i - 1)) != 0)
> +		i += i & ~(i - 1);
> +	
> +	return i;
> +}
> +
> +static inline unsigned long round_down_to_power_of_2(unsigned long i)
> +{
> +	while (i & (i - 1))
> +		i &= (i - 1);
> +	
> +	return i;
> +}

Some actual users, please. ;-)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
