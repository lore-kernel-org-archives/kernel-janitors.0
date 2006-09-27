From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Wed, 27 Sep 2006 22:31:29 +0000
Subject: Re: [KJ] [RFC] request_region() error handling fixes
Message-Id: <9a8748490609271531u3582c91bifc51f1c3d2c001a7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
In-Reply-To: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 27/09/06, Badari Pulavarty <pbadari@us.ibm.com> wrote:
> Hi,
>
> I started working on request_region() error handling fixes.
> Before I got too far, want to make sure its following approach
> is acceptable. (not happy with too many "goto" statements).
> Is there a better way to do this ?
>
> Please comment.
>
[snip]

If you don't like all these goto's :

> +       if (!request_region(0x20,0x20,"pic1")) {
> +               printk(KERN_WARNING"chrp_init: pic1 request region failed\n");
> +               return;
> +       }
> +       if (!request_region(0xa0,0x20,"pic2")) {
> +               printk(KERN_WARNING"chrp_init: pic2 request region failed\n");
> +               goto out5;
> +       }
> +       if (!request_region(0x00,0x20,"dma1")) {
> +               printk(KERN_WARNING"chrp_init: dma1 request region failed\n");
> +               goto out4;
> +       }
> +       if (!request_region(0x40,0x20,"timer")) {
> +               printk(KERN_WARNING"chrp_init: timer1 request region failed\n");
> +               goto out3;
> +       }
> +       if (!request_region(0x80,0x10,"dma page reg")) {
> +               printk(KERN_WARNING"chrp_init: dma page request region failed\n");
> +               goto out2;
> +       }
> +       if (!request_region(0xc0,0x20,"dma2")) {
> +               printk(KERN_WARNING"chrp_init: dma2 request region failed\n");
> +               goto out1;
> +       }
>
>         /* Get the event scan rate for the rtas so we know how
>          * often it expects a heartbeat. -- Cort
> @@ -551,6 +569,18 @@
>
>         if (ppc_md.progress)
>                 ppc_md.progress("  Have fun!    ", 0x7777);
> +       return;
> +out1:
> +       release_region(0x80, 0x10);
> +out2:
> +       release_region(0x40, 0x20);
> +out3:
> +       release_region(0x00, 0x20);
> +out4:
> +       release_region(0xa0, 0x20);
> +out5:
> +       release_region(0x20, 0x20);
> +       return;
>  }
>

then I see something like the following as possible alternatives,
although I think the goto one is actually the best :

1) Yes, this is ugly as hell and will possibly generate warnings at
runtime about freeing non existing resources, but it would work...
Not really an option...

       int status = 0;

       if (!request_region(0x20,0x20,"pic1")) {
               printk(KERN_WARNING"chrp_init: pic1 request region failed\n");
               return;
       }
       if (!request_region(0xa0,0x20,"pic2")) {
               printk(KERN_WARNING"chrp_init: pic2 request region failed\n");
               status++;
       }
       if (!request_region(0x00,0x20,"dma1")) {
               printk(KERN_WARNING"chrp_init: dma1 request region failed\n");
               status++;
       }
       if (!request_region(0x40,0x20,"timer")) {
               printk(KERN_WARNING"chrp_init: timer1 request region failed\n");
               status++;
       }
       if (!request_region(0x80,0x10,"dma page reg")) {
               printk(KERN_WARNING"chrp_init: dma page request region
failed\n");
               status++;
       }
       if (!request_region(0xc0,0x20,"dma2")) {
               printk(KERN_WARNING"chrp_init: dma2 request region failed\n");
               status++;
       }
       if (status) {
              /* one or more request_region() failed, release all */
              release_region(0x80, 0x10);
              release_region(0x40, 0x20);
              release_region(0x00, 0x20);
              release_region(0xa0, 0x20);
              release_region(0x20, 0x20);
              return;
       }


2) While this is an alternative, it duplicates a lot of code and is
really, really ugly - actually it makes my eyes hurt...

       if (request_region(0x20,0x20,"pic1")) {
         if (request_region(0xa0,0x20,"pic2")) {
           if (request_region(0x00,0x20,"dma1")) {
             if (request_region(0x40,0x20,"timer")) {
               if (request_region(0x80,0x10,"dma page reg")) {
                 if (!request_region(0xc0,0x20,"dma2")) {
                         printk(KERN_WARNING"chrp_init: dma2 request
region failed\n");
                         release_region(0x80, 0x10);
                         release_region(0x40, 0x20);
                         release_region(0x00, 0x20);
                         release_region(0xa0, 0x20);
                         release_region(0x20, 0x20);
                         return;
                 }
               } else {
                       printk(KERN_WARNING"chrp_init: dma page request
region failed\n");
                       release_region(0x40, 0x20);
                       release_region(0x00, 0x20);
                       release_region(0xa0, 0x20);
                       release_region(0x20, 0x20);
                       return;
               }
             } else {
                     printk(KERN_WARNING"chrp_init: timer1 request
region failed\n");
                     release_region(0x00, 0x20);
                     release_region(0xa0, 0x20);
                     release_region(0x20, 0x20);
                     return;
             }
           } else {
                   printk(KERN_WARNING"chrp_init: dma1 request region
failed\n");
                   release_region(0xa0, 0x20);
                   release_region(0x20, 0x20);
                   return;
           }
         } else {
                 printk(KERN_WARNING"chrp_init: pic2 request region failed\n");
                 release_region(0x20, 0x20);
                 return;
         }
       } else {
               printk(KERN_WARNING"chrp_init: pic1 request region failed\n");
               return;
       }


So I'd say your version with the goto's (which is similar to what's
used elsewhere in the kernel) is the right way to go...

Ohh btw, shouldn't there be a single space before your label names?  Like

 out4:

instead of

out4:

I seem to remember something about label names shouldn't start at column 0.


Also, in a line like this :

       if (!request_region(0x20,0x20,"pic1")) {

I think the consensus is that it should be spaced like this instead
(space after the commas):

       if (!request_region(0x20, 0x20, "pic1")) {


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
