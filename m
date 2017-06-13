From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Jun 2017 19:32:52 +0000
Subject: [bug report] irqdomain: Let irq_domain_mapping display hierarchical domains
Message-Id: <20170613193252.GA2224@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Marc Zyngier,

This is a semi-automatic email about new static checker warnings.

The patch fe17a42e704a: "irqdomain: Let irq_domain_mapping display 
hierarchical domains" from May 12, 2017, leads to the following 
Smatch complaint:

kernel/irq/irqdomain.c:772 virq_debug_show_one()
	 warn: variable dereferenced before check 'data' (see line 758)

kernel/irq/irqdomain.c
   757		while (domain) {
   758			unsigned int irq = data->irq;
                                           ^^^^^^^^^
Dereference.

   759			unsigned long hwirq = data->hwirq;
   760			struct irq_chip *chip;
   761			bool direct;
   762	
   763			if (data = &desc->irq_data)
   764				seq_printf(m, "%5d  ", irq);
   765			else
   766				seq_printf(m, "%5d+ ", irq);
   767			seq_printf(m, "0x%05lx  ", hwirq);
   768	
   769			chip = irq_data_get_irq_chip(data);
   770			seq_printf(m, "%-15s  ", (chip && chip->name) ? chip->name : "none");
   771	
   772			seq_printf(m, data ? "0x%p  " : "  %p  ",
                                      ^^^^
Too late to check.

   773				   irq_data_get_irq_chip_data(data));
   774	

regards,
dan carpenter
