From: ville palo <ville.palo@vi64pa.net>
Date: Tue, 05 Sep 2006 13:11:10 +0000
Subject: Re: [KJ] [PATCH] oss/btaudio.c: Check ioremap return value and	free
Message-Id: <1157461870.7553.3.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1157300808.6767.10.camel@localhost.localdomain>
In-Reply-To: <1157300808.6767.10.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2006-09-05 at 00:04 +0200, Domen Puncer wrote:
> On 03/09/06 19:26 +0300, ville palo wrote:
> > 
> > Check return value of the ioremap() and balance ioremap()
> > with iounmap().
> > 
> > Signed-off-by: Ville Palo <ville.palo@vi64pa.net>
> > 
> > diff --git a/sound/oss/btaudio.c b/sound/oss/btaudio.c
> > index 324a81f..9b1837f 100644
> > --- a/sound/oss/btaudio.c
> > +++ b/sound/oss/btaudio.c
> > @@ -927,6 +927,10 @@ static int __devinit btaudio_probe(struc
> >  	bta->mem  = pci_resource_start(pci_dev,0);
> >  	bta->mmio = ioremap(pci_resource_start(pci_dev,0),
> >  			    pci_resource_len(pci_dev,0));
> > +	if (!bta->mmio) {
> > +		rc = -EIO;
> > +		goto fail1;
> > +	}
> >  
> >  	bta->source     = 1;
> >  	bta->bits       = 8;
> > @@ -1019,6 +1023,7 @@ static int __devinit btaudio_probe(struc
> >  		unregister_sound_dsp(bta->dsp_digital);
> >   fail2:
> >          free_irq(bta->irq,bta);	
> > +	iounmap(bta->mmio);
> 
> Why here?
> This won't work if ie. request_irq fails.
> 

Thanks, you are right. Here's the corrected patch


Signed-off-by: Ville Palo <ville.palo@vi64pa.net>

diff --git a/sound/oss/btaudio.c b/sound/oss/btaudio.c
index 324a81f..d6c21b0 100644
--- a/sound/oss/btaudio.c
+++ b/sound/oss/btaudio.c
@@ -927,6 +927,10 @@ static int __devinit btaudio_probe(struc
 	bta->mem  = pci_resource_start(pci_dev,0);
 	bta->mmio = ioremap(pci_resource_start(pci_dev,0),
 			    pci_resource_len(pci_dev,0));
+	if (!bta->mmio) {
+		rc = -EIO;
+		goto fail1;
+	}
 
 	bta->source     = 1;
 	bta->bits       = 8;
@@ -970,7 +974,7 @@ static int __devinit btaudio_probe(struc
 			      "btaudio",(void *)bta)) < 0) {
 		printk(KERN_WARNING
 		       "btaudio: can't request irq (rc=%d)\n",rc);
-		goto fail1;
+		goto fail2;
 	}
 
 	/* register devices */
@@ -980,7 +984,7 @@ static int __devinit btaudio_probe(struc
 		if (rc < 0) {
 			printk(KERN_WARNING
 			       "btaudio: can't register digital dsp (rc=%d)\n",rc);
-			goto fail2;
+			goto fail3;
 		}
 		printk(KERN_INFO "btaudio: registered device dsp%d [digital]\n",
 		       bta->dsp_digital >> 4);
@@ -991,7 +995,7 @@ static int __devinit btaudio_probe(struc
 		if (rc < 0) {
 			printk(KERN_WARNING
 			       "btaudio: can't register analog dsp (rc=%d)\n",rc);
-			goto fail3;
+			goto fail4;
 		}
 		printk(KERN_INFO "btaudio: registered device dsp%d [analog]\n",
 		       bta->dsp_analog >> 4);
@@ -999,7 +1003,7 @@ static int __devinit btaudio_probe(struc
 		if (rc < 0) {
 			printk(KERN_WARNING
 			       "btaudio: can't register mixer (rc=%d)\n",rc);
-			goto fail4;
+			goto fail5;
 		}
 		printk(KERN_INFO "btaudio: registered device mixer%d\n",
 		       bta->mixer_dev >> 4);
@@ -1012,13 +1016,15 @@ static int __devinit btaudio_probe(struc
 	pci_set_drvdata(pci_dev,bta);
         return 0;
 
- fail4:
+ fail5:
 	unregister_sound_dsp(bta->dsp_analog);
- fail3:
+ fail4:
 	if (digital)
 		unregister_sound_dsp(bta->dsp_digital);
- fail2:
-        free_irq(bta->irq,bta);	
+ fail3:	
+	free_irq(bta->irq,bta);
+ fail2:        
+	iounmap(bta->mmio);
  fail1:
 	kfree(bta);
  fail0:
@@ -1047,6 +1053,8 @@ static void __devexit btaudio_remove(str
 	}
 
 	/* free resources */
+	if (bta->mmio)
+		iounmap(bta->mmio);
 	free_buffer(bta);
         free_irq(bta->irq,bta);
 	release_mem_region(pci_resource_start(pci_dev,0),


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
