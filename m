From: Domen Puncer <domen@coderock.org>
Date: Fri, 28 May 2004 17:17:33 +0000
Subject: [Kernel-janitors] Re: replacing driver_data access by
Message-Id: <20040528171733.GA2186@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52363585388432154=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52363585388432154==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 28/05/04 14:33 +0200, Yoon Soo wrote:
> as I can see, this is mostly cosmetic and doesnt change the code too
> much. So it is just tested to compile and modified kernel is running
> without probs here. But many changes didnt touched it anyway, because
> these drivers are unused here.
> 
> Hope it is ok. I took care of tabs and spaces..I think. Another
> question: Should I split a patch of this size or is it ok?


Patch per file is usualy better, especialy if they get sent to
different people.
In this case, maybe patch per directory would be better.

In addition to what Greg, some nit picking from me:

> -    eisa_root_dev.dev.driver_data = &eisa_bus_root;
> +    dev_set_drvdata(eisa_root_dev.dev,&eisa_bus_root);
...
> -    ud->device.driver_data = node_info;
> +    dev_set_drvdata(ud->device,node_info);
>     new_node->ud = ud;
Space after ',' please.


> -        node_info = (struct eth1394_node_info*)ud->device.driver_data;
> +        node_info = (struct eth1394_node_info*)dev_get_drvdata(ud->device);

driver_data is (void *), so you can remove type casts.


> diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/cio/ccwgroup.c
> -    if (cdev->dev.driver_data) {
> -        gdev = (struct ccwgroup_device *)cdev->dev.driver_data;
> +    if (dev_get_drvdata(cdev->dev)) {
> +        gdev = (struct ccwgroup_device *)dev_get_drvdata(cdev->dev);
How about:
gdev = dev_get_drvdata(cdev->dev)
if (gdev) { ...


	Domen

--===============52363585388432154==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52363585388432154==--
