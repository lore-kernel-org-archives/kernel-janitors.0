From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Nov 2020 06:20:13 +0000
Subject: Re: [bug report] nitro_enclaves: Add logic for setting an enclave vCPU
Message-Id: <20201102062013.GC12347@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201030113033.GA3251003@mwanda>
In-Reply-To: <20201030113033.GA3251003@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 30, 2020 at 05:23:18PM +0200, Paraschiv, Andra-Irina wrote:
> 
> 
> On 30/10/2020 13:30, Dan Carpenter wrote:
> > 
> > Hello Andra Paraschiv,
> > 
> > The patch ff8a4d3e3a99: "nitro_enclaves: Add logic for setting an
> > enclave vCPU" from Sep 21, 2020, leads to the following static
> > checker warning:
> > 
> >          drivers/virt/nitro_enclaves/ne_misc_dev.c:471 ne_donated_cpu()
> >          error: passing untrusted data 'cpu' to 'cpumask_test_cpu()'
> > 
> > drivers/virt/nitro_enclaves/ne_misc_dev.c
> >    1093          switch (cmd) {
> >    1094          case NE_ADD_VCPU: {
> >    1095                  int rc = -EINVAL;
> >    1096                  u32 vcpu_id = 0;
> >    1097
> >    1098                  if (copy_from_user(&vcpu_id, (void __user *)arg, sizeof(vcpu_id)))
> >                                             ^^^^^^^^
> > 
> >    1099                          return -EFAULT;
> >    1100
> >    1101                  mutex_lock(&ne_enclave->enclave_info_mutex);
> >    1102
> >    1103                  if (ne_enclave->state != NE_STATE_INIT) {
> >    1104                          dev_err_ratelimited(ne_misc_dev.this_device,
> >    1105                                              "Enclave is not in init state\n");
> >    1106
> >    1107                          mutex_unlock(&ne_enclave->enclave_info_mutex);
> >    1108
> >    1109                          return -NE_ERR_NOT_IN_INIT_STATE;
> >    1110                  }
> >    1111
> >    1112                  if (vcpu_id >= (ne_enclave->nr_parent_vm_cores *
> >    1113                      ne_enclave->nr_threads_per_core)) {
> > 
> > To prevent a buffer overflow vcpu_id has to be less than "nr_cpu_ids".
> > Is "ne_enclave->nr_parent_vm_cores * ne_enclave->nr_threads_per_core"
> > <= nr_cpu_ids?  If so then it's fine.
> 
> Hi Dan,
> 
> Thanks for reaching out with regard to this reported issue from the static
> analysis.
> 
> "nr_cpu_ids" is used when the number of cores is initialized, so it should
> be fine. Let me know if I miss something and a check has to be added to
> directly compare to "nr_cpu_ids".

Yeah.  That works.  Thanks for taking a look at this.

regards,
dan carpenter
