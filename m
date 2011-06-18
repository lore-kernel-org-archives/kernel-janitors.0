From: "Winkler, Tomas" <tomas.winkler@intel.com>
Date: Sat, 18 Jun 2011 20:29:25 +0000
Subject: RE: [patch] Staging: easycap: use after free in easycap_delete()
Message-Id: <6F5C1D715B2DA5498A628E6B9C124F0401B8465429@hasmsx504.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110617102508.GD2520@shale.localdomain>
In-Reply-To: <20110617102508.GD2520@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



> -----Original Message-----
> From: Dan Carpenter [mailto:error27@gmail.com]
> Sent: Friday, June 17, 2011 1:25 PM
> To: Greg Kroah-Hartman
> Cc: Winkler, Tomas; Mike Thomas; open list:STAGING SUBSYSTEM; kernel-
> janitors@vger.kernel.org
> Subject: [patch] Staging: easycap: use after free in easycap_delete()
> 
> The JOM() macro dereferences peasycap, so I moved the free down some
> lines.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
ACK
Thanks
Tomas


---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

