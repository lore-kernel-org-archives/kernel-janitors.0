From: Adam Ward <Adam.Ward.opensource@diasemi.com>
Date: Mon, 07 Dec 2020 17:08:12 +0000
Subject: RE: [bug report] regulator: da9121: Add support for device variants via devicetree
Message-Id: <AM6PR10MB2807C57FD4B840E006434443ECCE0@AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8pOUyVj5Q8iQYJI@mwanda>
In-Reply-To: <X8pOUyVj5Q8iQYJI@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 4 Dec 2020 14:57, Dan Carpenter wrote:

>    366          if (pdata->num_buck > variant_parameters[chip-
> >variant_id].num_bucks) {
>                                     ^^
> Smatch is complaining that this sort of looks like it should be >=
> instead of >.  This looks true to me as well, but I'm not positive
> enough to actually send a patch.  :P

As it goes, that bit is fine - it's for if a second buck is configured on a single buck variant.

>    383                  if (of_property_read_u32(da9121_matches[pdata-
> >num_buck].of_node,
>                                                                 ^^^^^^^^^^^^^^^
> We know that .num_bucks is 2 here so if ->num_buck is == to that then
> this is one element beyond the end of the array.

But this is a nice catch - thank you.

Regards,
Adam
