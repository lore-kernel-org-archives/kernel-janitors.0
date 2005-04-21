From: blm@woodheap.org
Date: Thu, 21 Apr 2005 10:48:43 +0000
Subject: [KJ] Status of TODO item  jiffies towards end
Message-Id: <20050421104843.GA20839@gatekeeper>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============043915803901483308=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============043915803901483308==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I am new at this but am very keen to contribute.  I 
thought I would start at the end of the TODO on the 
web site (hoping noone else thought of the same thing) 
and see what happens.

The item:

Some drivers do:

        if ((jiffies - data->last_updated > HZ * 2) ||
            (jiffies < data->last_updated))

Should be:

        #include <linux/jiffies.h>
        if (time_after(jiffies, data->last_updated + HZ * 2))

Have a patch for drivers/i2c/chips/*.

It seems this has been fixed because I only found the 
problem code in drivers/i2c/chips/* in kernel source 2.6.10.

Are there any items that need attention that it is known that 
noone is working on?  What kernel tree should I be looking at?

Ben Marsh

--===============043915803901483308==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============043915803901483308==--
