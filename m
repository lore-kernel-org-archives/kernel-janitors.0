From: maximilian attems <janitor@sternwelten.at>
Date: Fri, 18 Jun 2004 09:41:32 +0000
Subject: Re: [Kernel-janitors] [Patch] drivedata access replacement
Message-Id: <20040618094132.GB21628@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72799463624026983=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040603184201.GA26906@nlx.t-online.de>
In-Reply-To: <20040603184201.GA26906@nlx.t-online.de>
To: kernel-janitors@vger.kernel.org

--===============72799463624026983==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 03 Jun 2004, yoonsoo@web.de wrote:

> sorry again for making every mistake that could be made :(
> 
> Now hopefully everything is fine.
> 
> All changes are tested to compile. Changes are made to avoid direct
> access to the driver_data fields and to use get/set_drvdata methods
> instead.

please provide 1 diff / file, 
if you don't feel like flooding the kj mailing list,
place them on the web, do not forget to add to each
patch as "header" a nice description.

thanks maks


--===============72799463624026983==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72799463624026983==--
