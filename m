From: ville palo <ville.palo@vi64pa.net>
Date: Sat, 02 Sep 2006 16:15:49 +0000
Subject: Re: [KJ] [PATCH] scsi/gdth.c: Added checks for
Message-Id: <1157213749.9695.27.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1157201011.9695.17.camel@localhost.localdomain>
In-Reply-To: <1157201011.9695.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 2006-09-02 at 17:21 +0200, walter harms wrote:
> i am not sure how the driver behaves but i would expect something like:
> shp = scsi_register(shtp,sizeof(gdth_num_str);
> if ( shp = NULL) {
> 	-inform user
> 	-cleanup debris
> }
> 

I found it be a common way in this driver:

shp = scsi_register(shtp,sizeof(gdth_ext_str));
if (shp = NULL)
	continue;  

Several same kind of segments can be found in gdth.c.



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
