From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 13 Jul 2004 16:28:13 +0000
Subject: [Kernel-janitors] acpi_os_sleep()
Message-Id: <40F40D9D.3000409@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, kernel-janitors-qjLDD68F18O7TbgM5vRIOg@public.gmane.org

Hi,

In continuing to replace, where appropriate, code with msleep() calls, I 
ran across drivers/acpi/osl.c::acpi_os_sleep():

void
acpi_os_sleep(u32 sec, u32 ms)
{
        current->state = TASK_INTERRUPTIBLE;
        schedule_timeout(HZ * sec + (ms * HZ) / 1000);
}

I was wondering if this needed to run in TASK_INTERRUPTIBLE or whether I 
could go ahead and replace it with msleep() (which runs in 
TASK_UNINTERRUPTIBLE).

Thanks,
Nish
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
