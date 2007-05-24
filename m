From: "linux newbie" <newblinux@gmail.com>
Date: Thu, 24 May 2007 11:32:29 +0000
Subject: [KJ] Anybody is working on this todo ?
Message-Id: <d701b6e30705240432g51170ec8od7bcbea660fbf7b4@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3689876930106769779=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============3689876930106769779==
Content-Type: multipart/alternative; 
	boundary="----=_Part_146115_13908643.1180006349225"

------=_Part_146115_13908643.1180006349225
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

      I am a newbie . I would to start my kernal hacking by code cleanup. I
would like to do the following work.

-------------------------------------------------------------------------------
From: Greg KH

- delete all pci_find_* functions from the kernel tree. Instead of
pci_find_device use pci_get_device().

> Looking at pci.txt, it appears that if I use pci_get_device(), I will >
also need to use pci_dev_put().

also check using the proper shutdown callback.

- convert from pci_module_init to pci_register_driver

- don't do it for drivers that are 2.4 compatible
-----------------------------------------------------------------------------------------------------

    Right now my laptop is not ready with linux.. I hope I will get ready to
go soon (expecting within 2 or 3 days). Before that I just wanted to know
that Anybody is working on this job. If so, I am ready to help them out ...
otherwise have to take other job.

Thanks
newbie

------=_Part_146115_13908643.1180006349225
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>&nbsp;</div>
<div>Hello,</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am a newbie . I would to start my kernal hacking by code cleanup. I would like to do the following work. </div>
<div>&nbsp; </div>
<div>-------------------------------------------------------------------------------</div>
<div>From: Greg KH <span class="anchor" id="line-263"></span><span class="anchor" id="line-264"></span></div>
<p class="line862">- delete all <tt class="backtick">pci_find_*</tt> functions from the kernel tree. Instead of <tt class="backtick">pci_find_device</tt> use <tt class="backtick">pci_get_device()</tt>. <span class="anchor" id="line-265">
</span><span class="anchor" id="line-266"></span>
<p class="line867">&gt; Looking at pci.txt, it appears that if I use pci_get_device(), I will <span class="anchor" id="line-267"></span>&gt; also need to use pci_dev_put(). <span class="anchor" id="line-268"></span><span class="anchor" id="line-269">
</span>
<p class="line874">also check using the proper shutdown callback. <span class="anchor" id="line-270"></span><span class="anchor" id="line-271"></span>
<p class="line862">- convert from <tt class="backtick">pci_module_init</tt> to <tt class="backtick">pci_register_driver</tt> <span class="anchor" id="line-272"></span>
<p style="LIST-STYLE-TYPE: none">- don&#39;t do it for drivers that are 2.4 compatible </p>
<div style="LIST-STYLE-TYPE: none">-----------------------------------------------------------------------------------------------------</div>
<div style="LIST-STYLE-TYPE: none">&nbsp;</div>
<div style="LIST-STYLE-TYPE: none">&nbsp;&nbsp;&nbsp; Right now my laptop is not ready with linux.. I hope I will get ready to go soon (expecting within 2 or 3 days). Before that I just wanted to know that Anybody is working on this job. If so, I am ready to help them out ... otherwise have to take other job. 
</div>
<div style="LIST-STYLE-TYPE: none">&nbsp;</div>
<div style="LIST-STYLE-TYPE: none">Thanks</div>
<div style="LIST-STYLE-TYPE: none">newbie</div></p></p></p></p>

------=_Part_146115_13908643.1180006349225--

--===============3689876930106769779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============3689876930106769779==--
