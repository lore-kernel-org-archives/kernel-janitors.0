From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 30 Apr 2010 05:11:02 +0000
Subject: Re: [PATCH] drivers/staging/comedi: dev_node removal
Message-Id: <t2w390803461004292211w207da067ob81522720005fecb@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1272258528.29373.7.camel@lenovo>
In-Reply-To: <1272258528.29373.7.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

>
> Yes, I've picked up the checkpatch changes in my staging-next tree, but
> I think you have to put the dev node stuff through the pcmcia tree as it
> will not build without it, right?
>

Yes. the driver doesn't build on both trees due the changes in struct
pcmcia_device. I'm going to regenerate the patch against pcmcia tree
and send it to Dominik Brodowski.

Thanks a lot

Best regards

-----------------------------------------
Javier Mart=C3=ADnez Canillas
+595 981 88 66 58
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
