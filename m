From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 26 Dec 2011 13:44:58 +0000
Subject: devm_kfree
Message-Id: <alpine.DEB.2.02.1112261440450.1873@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324661974-17281-1-git-send-email-julia@diku.dk> <20111226120855.GB17760@sirena.org.uk>
In-Reply-To: <20111226120855.GB17760@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Julia Lawall <julia@diku.dk>, Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Is it reasonable to use devm_kfree in a probe function that fails or a 
remove function that succeeds?

Examples from drivers/watchdog/shwdt.c:

sh_wdt_probe:

 	...
  out_unreg:
         unregister_reboot_notifier(&sh_wdt_notifier);
  out_unmap:
-       devm_iounmap(&pdev->dev, wdt->base);
  out_err:
-       devm_kfree(&pdev->dev, wdt);
  out_release:
-       devm_release_mem_region(&pdev->dev, res->start, 
resource_size(res));

         return rc;
  }


sh_wdt_remove:

 	...
         unregister_reboot_notifier(&sh_wdt_notifier);
         devm_release_mem_region(&pdev->dev, res->start, resource_size(res));
         devm_iounmap(&pdev->dev, wdt->base);
         devm_kfree(&pdev->dev, wdt);

 	return 0;
}


On the other hand, perhaps devm_kfree is needed in probe function that 
succeeds, eg in drivers/input/keyboard/samsung-keypad.c:

         if (pdev->dev.of_node) {
                 devm_kfree(&pdev->dev, (void *)pdata->keymap_data->keymap);
                 devm_kfree(&pdev->dev, (void *)pdata->keymap_data);
                 devm_kfree(&pdev->dev, (void *)pdata);
         }
         return 0;

julia
