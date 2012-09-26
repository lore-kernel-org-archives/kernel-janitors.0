From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 26 Sep 2012 15:59:10 +0000
Subject: [next:akpm 26/413] kernel/sys.c:1868:14: sparse: incorrect type in argument 1 (different base types)
Message-Id: <20120926155910.GA14447@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zYM0uCDKw75PZbzx"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cyrill,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
head:   dad0019944369f58c193c1991c39ffda7ff584d2
commit: c9eeef146c554f8ddcdf5916fb93621f0579e2f8 [26/413] prctl: use access_ok() instead of TASK_SIZE in prctl_set_mm()

  kernel/sys.c:1048:38: sparse: incorrect type in argument 2 (different modifiers)
  kernel/sys.c:1048:38:    expected unsigned long [nocast] [usertype] *ut
  kernel/sys.c:1048:38:    got unsigned long *<noident>
  kernel/sys.c:1048:38: sparse: implicit cast to nocast type
  kernel/sys.c:1048:48: sparse: incorrect type in argument 3 (different modifiers)
  kernel/sys.c:1048:48:    expected unsigned long [nocast] [usertype] *st
  kernel/sys.c:1048:48:    got unsigned long *<noident>
  kernel/sys.c:1048:48: sparse: implicit cast to nocast type
  kernel/sys.c:1112:32: sparse: incorrect type in argument 1 (different address spaces)
  kernel/sys.c:1112:32:    expected struct task_struct *p1
  kernel/sys.c:1112:32:    got struct task_struct [noderef] <asn:4>*real_parent
  kernel/sys.c:1701:25: sparse: implicit cast to nocast type
  kernel/sys.c:1704:38: sparse: incorrect type in argument 2 (different modifiers)
  kernel/sys.c:1704:38:    expected unsigned long [nocast] [usertype] *ut
  kernel/sys.c:1704:38:    got unsigned long *<noident>
  kernel/sys.c:1704:38: sparse: implicit cast to nocast type
  kernel/sys.c:1704:46: sparse: incorrect type in argument 3 (different modifiers)
  kernel/sys.c:1704:46:    expected unsigned long [nocast] [usertype] *st
  kernel/sys.c:1704:46:    got unsigned long *<noident>
  kernel/sys.c:1704:46: sparse: implicit cast to nocast type
  kernel/sys.c:1730:48: sparse: incorrect type in argument 2 (different modifiers)
  kernel/sys.c:1730:48:    expected unsigned long [nocast] [usertype] *ut
  kernel/sys.c:1730:48:    got unsigned long *<noident>
  kernel/sys.c:1730:48: sparse: implicit cast to nocast type
  kernel/sys.c:1730:58: sparse: incorrect type in argument 3 (different modifiers)
  kernel/sys.c:1730:58:    expected unsigned long [nocast] [usertype] *st
  kernel/sys.c:1730:58:    got unsigned long *<noident>
  kernel/sys.c:1730:58: sparse: implicit cast to nocast type
+ kernel/sys.c:1868:14: sparse: incorrect type in argument 1 (different base types)
  kernel/sys.c:1868:14:    expected void const volatile [noderef] <asn:1>*<noident>
  kernel/sys.c:1868:14:    got unsigned long [unsigned] addr
  kernel/sys.c:1984:16: sparse: incorrect type in argument 1 (different address spaces)
  kernel/sys.c:1984:16:    expected void const volatile [noderef] <asn:1>*<noident>
  kernel/sys.c:1984:16:    got int [noderef] <asn:1>**tid_addr

vim +1868 kernel/sys.c
  1852				unsigned long arg4, unsigned long arg5)
  1853	{
  1854		unsigned long rlim = rlimit(RLIMIT_DATA);
  1855		struct mm_struct *mm = current->mm;
  1856		struct vm_area_struct *vma;
  1857		int error;
  1858	
  1859		if (arg5 || (arg4 && opt != PR_SET_MM_AUXV))
  1860			return -EINVAL;
  1861	
  1862		if (!capable(CAP_SYS_RESOURCE))
  1863			return -EPERM;
  1864	
  1865		if (opt == PR_SET_MM_EXE_FILE)
  1866			return prctl_set_mm_exe_file(mm, (unsigned int)addr);
  1867	
> 1868		if (!access_ok(VERIFY_READ, addr, sizeof(addr)) || addr < mmap_min_addr)
  1869			return -EINVAL;
  1870	
  1871		error = -EINVAL;
  1872	
  1873		down_read(&mm->mmap_sem);
  1874		vma = find_vma(mm, addr);
  1875	
  1876		switch (opt) {

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

--zYM0uCDKw75PZbzx
Content-Type: text/x-csrc; charset="iso-8859-1"
Content-Disposition: attachment; filename="sys.c"
Content-Transfer-Encoding: quoted-printable

/*
 *  linux/kernel/sys.c
 *
 *  Copyright (C) 1991, 1992  Linus Torvalds
 */

#include <linux/export.h>
#include <linux/mm.h>
#include <linux/utsname.h>
#include <linux/mman.h>
#include <linux/reboot.h>
#include <linux/prctl.h>
#include <linux/highuid.h>
#include <linux/fs.h>
#include <linux/kmod.h>
#include <linux/perf_event.h>
#include <linux/resource.h>
#include <linux/kernel.h>
#include <linux/kexec.h>
#include <linux/workqueue.h>
#include <linux/capability.h>
#include <linux/device.h>
#include <linux/key.h>
#include <linux/times.h>
#include <linux/posix-timers.h>
#include <linux/security.h>
#include <linux/dcookies.h>
#include <linux/suspend.h>
#include <linux/tty.h>
#include <linux/signal.h>
#include <linux/cn_proc.h>
#include <linux/getcpu.h>
#include <linux/task_io_accounting_ops.h>
#include <linux/seccomp.h>
#include <linux/cpu.h>
#include <linux/personality.h>
#include <linux/ptrace.h>
#include <linux/fs_struct.h>
#include <linux/file.h>
#include <linux/mount.h>
#include <linux/gfp.h>
#include <linux/syscore_ops.h>
#include <linux/version.h>
#include <linux/ctype.h>

#include <linux/compat.h>
#include <linux/syscalls.h>
#include <linux/kprobes.h>
#include <linux/user_namespace.h>

#include <linux/kmsg_dump.h>
/* Move somewhere else to avoid recompiling? */
#include <generated/utsrelease.h>

#include <asm/uaccess.h>
#include <asm/io.h>
#include <asm/unistd.h>

#ifndef SET_UNALIGN_CTL
# define SET_UNALIGN_CTL(a,b)	(-EINVAL)
#endif
#ifndef GET_UNALIGN_CTL
# define GET_UNALIGN_CTL(a,b)	(-EINVAL)
#endif
#ifndef SET_FPEMU_CTL
# define SET_FPEMU_CTL(a,b)	(-EINVAL)
#endif
#ifndef GET_FPEMU_CTL
# define GET_FPEMU_CTL(a,b)	(-EINVAL)
#endif
#ifndef SET_FPEXC_CTL
# define SET_FPEXC_CTL(a,b)	(-EINVAL)
#endif
#ifndef GET_FPEXC_CTL
# define GET_FPEXC_CTL(a,b)	(-EINVAL)
#endif
#ifndef GET_ENDIAN
# define GET_ENDIAN(a,b)	(-EINVAL)
#endif
#ifndef SET_ENDIAN
# define SET_ENDIAN(a,b)	(-EINVAL)
#endif
#ifndef GET_TSC_CTL
# define GET_TSC_CTL(a)		(-EINVAL)
#endif
#ifndef SET_TSC_CTL
# define SET_TSC_CTL(a)		(-EINVAL)
#endif

/*
 * this is where the system-wide overflow UID and GID are defined, for
 * architectures that now have 32-bit UID/GID but didn't in the past
 */

int overflowuid =3D DEFAULT_OVERFLOWUID;
int overflowgid =3D DEFAULT_OVERFLOWGID;

EXPORT_SYMBOL(overflowuid);
EXPORT_SYMBOL(overflowgid);

/*
 * the same as above, but for filesystems which can only store a 16-bit
 * UID and GID. as such, this is needed on all architectures
 */

int fs_overflowuid =3D DEFAULT_FS_OVERFLOWUID;
int fs_overflowgid =3D DEFAULT_FS_OVERFLOWUID;

EXPORT_SYMBOL(fs_overflowuid);
EXPORT_SYMBOL(fs_overflowgid);

/*
 * this indicates whether you can reboot with ctrl-alt-del: the default is =
yes
 */

int C_A_D =3D 1;
struct pid *cad_pid;
EXPORT_SYMBOL(cad_pid);

/*
 * If set, this is used for preparing the system to power off.
 */

void (*pm_power_off_prepare)(void);

/*
 * Returns true if current's euid is same as p's uid or euid,
 * or has CAP_SYS_NICE to p's user_ns.
 *
 * Called with rcu_read_lock, creds are safe
 */
static bool set_one_prio_perm(struct task_struct *p)
{
	const struct cred *cred =3D current_cred(), *pcred =3D __task_cred(p);

	if (uid_eq(pcred->uid,  cred->euid) ||
	    uid_eq(pcred->euid, cred->euid))
		return true;
	if (ns_capable(pcred->user_ns, CAP_SYS_NICE))
		return true;
	return false;
}

/*
 * set the priority of a task
 * - the caller must hold the RCU read lock
 */
static int set_one_prio(struct task_struct *p, int niceval, int error)
{
	int no_nice;

	if (!set_one_prio_perm(p)) {
		error =3D -EPERM;
		goto out;
	}
	if (niceval < task_nice(p) && !can_nice(p, niceval)) {
		error =3D -EACCES;
		goto out;
	}
	no_nice =3D security_task_setnice(p, niceval);
	if (no_nice) {
		error =3D no_nice;
		goto out;
	}
	if (error =3D=3D -ESRCH)
		error =3D 0;
	set_user_nice(p, niceval);
out:
	return error;
}

SYSCALL_DEFINE3(setpriority, int, which, int, who, int, niceval)
{
	struct task_struct *g, *p;
	struct user_struct *user;
	const struct cred *cred =3D current_cred();
	int error =3D -EINVAL;
	struct pid *pgrp;
	kuid_t uid;

	if (which > PRIO_USER || which < PRIO_PROCESS)
		goto out;

	/* normalize: avoid signed division (rounding problems) */
	error =3D -ESRCH;
	if (niceval < -20)
		niceval =3D -20;
	if (niceval > 19)
		niceval =3D 19;

	rcu_read_lock();
	read_lock(&tasklist_lock);
	switch (which) {
		case PRIO_PROCESS:
			if (who)
				p =3D find_task_by_vpid(who);
			else
				p =3D current;
			if (p)
				error =3D set_one_prio(p, niceval, error);
			break;
		case PRIO_PGRP:
			if (who)
				pgrp =3D find_vpid(who);
			else
				pgrp =3D task_pgrp(current);
			do_each_pid_thread(pgrp, PIDTYPE_PGID, p) {
				error =3D set_one_prio(p, niceval, error);
			} while_each_pid_thread(pgrp, PIDTYPE_PGID, p);
			break;
		case PRIO_USER:
			uid =3D make_kuid(cred->user_ns, who);
			user =3D cred->user;
			if (!who)
				uid =3D cred->uid;
			else if (!uid_eq(uid, cred->uid) &&
				 !(user =3D find_user(uid)))
				goto out_unlock;	/* No processes for this user */

			do_each_thread(g, p) {
				if (uid_eq(task_uid(p), uid))
					error =3D set_one_prio(p, niceval, error);
			} while_each_thread(g, p);
			if (!uid_eq(uid, cred->uid))
				free_uid(user);		/* For find_user() */
			break;
	}
out_unlock:
	read_unlock(&tasklist_lock);
	rcu_read_unlock();
out:
	return error;
}

/*
 * Ugh. To avoid negative return values, "getpriority()" will
 * not return the normal nice-value, but a negated value that
 * has been offset by 20 (ie it returns 40..1 instead of -20..19)
 * to stay compatible.
 */
SYSCALL_DEFINE2(getpriority, int, which, int, who)
{
	struct task_struct *g, *p;
	struct user_struct *user;
	const struct cred *cred =3D current_cred();
	long niceval, retval =3D -ESRCH;
	struct pid *pgrp;
	kuid_t uid;

	if (which > PRIO_USER || which < PRIO_PROCESS)
		return -EINVAL;

	rcu_read_lock();
	read_lock(&tasklist_lock);
	switch (which) {
		case PRIO_PROCESS:
			if (who)
				p =3D find_task_by_vpid(who);
			else
				p =3D current;
			if (p) {
				niceval =3D 20 - task_nice(p);
				if (niceval > retval)
					retval =3D niceval;
			}
			break;
		case PRIO_PGRP:
			if (who)
				pgrp =3D find_vpid(who);
			else
				pgrp =3D task_pgrp(current);
			do_each_pid_thread(pgrp, PIDTYPE_PGID, p) {
				niceval =3D 20 - task_nice(p);
				if (niceval > retval)
					retval =3D niceval;
			} while_each_pid_thread(pgrp, PIDTYPE_PGID, p);
			break;
		case PRIO_USER:
			uid =3D make_kuid(cred->user_ns, who);
			user =3D cred->user;
			if (!who)
				uid =3D cred->uid;
			else if (!uid_eq(uid, cred->uid) &&
				 !(user =3D find_user(uid)))
				goto out_unlock;	/* No processes for this user */

			do_each_thread(g, p) {
				if (uid_eq(task_uid(p), uid)) {
					niceval =3D 20 - task_nice(p);
					if (niceval > retval)
						retval =3D niceval;
				}
			} while_each_thread(g, p);
			if (!uid_eq(uid, cred->uid))
				free_uid(user);		/* for find_user() */
			break;
	}
out_unlock:
	read_unlock(&tasklist_lock);
	rcu_read_unlock();

	return retval;
}

/**
 *	emergency_restart - reboot the system
 *
 *	Without shutting down any hardware or taking any locks
 *	reboot the system.  This is called when we know we are in
 *	trouble so this is our best effort to reboot.  This is
 *	safe to call in interrupt context.
 */
void emergency_restart(void)
{
	kmsg_dump(KMSG_DUMP_EMERG);
	machine_emergency_restart();
}
EXPORT_SYMBOL_GPL(emergency_restart);

void kernel_restart_prepare(char *cmd)
{
	blocking_notifier_call_chain(&reboot_notifier_list, SYS_RESTART, cmd);
	system_state =3D SYSTEM_RESTART;
	usermodehelper_disable();
	device_shutdown();
	syscore_shutdown();
}

/**
 *	register_reboot_notifier - Register function to be called at reboot time
 *	@nb: Info about notifier function to be called
 *
 *	Registers a function with the list of functions
 *	to be called at reboot time.
 *
 *	Currently always returns zero, as blocking_notifier_chain_register()
 *	always returns zero.
 */
int register_reboot_notifier(struct notifier_block *nb)
{
	return blocking_notifier_chain_register(&reboot_notifier_list, nb);
}
EXPORT_SYMBOL(register_reboot_notifier);

/**
 *	unregister_reboot_notifier - Unregister previously registered reboot not=
ifier
 *	@nb: Hook to be unregistered
 *
 *	Unregisters a previously registered reboot
 *	notifier function.
 *
 *	Returns zero on success, or %-ENOENT on failure.
 */
int unregister_reboot_notifier(struct notifier_block *nb)
{
	return blocking_notifier_chain_unregister(&reboot_notifier_list, nb);
}
EXPORT_SYMBOL(unregister_reboot_notifier);

/**
 *	kernel_restart - reboot the system
 *	@cmd: pointer to buffer containing command to execute for restart
 *		or %NULL
 *
 *	Shutdown everything and perform a clean reboot.
 *	This is not safe to call in interrupt context.
 */
void kernel_restart(char *cmd)
{
	kernel_restart_prepare(cmd);
	if (!cmd)
		printk(KERN_EMERG "Restarting system.\n");
	else
		printk(KERN_EMERG "Restarting system with command '%s'.\n", cmd);
	kmsg_dump(KMSG_DUMP_RESTART);
	machine_restart(cmd);
}
EXPORT_SYMBOL_GPL(kernel_restart);

static void kernel_shutdown_prepare(enum system_states state)
{
	blocking_notifier_call_chain(&reboot_notifier_list,
		(state =3D=3D SYSTEM_HALT)?SYS_HALT:SYS_POWER_OFF, NULL);
	system_state =3D state;
	usermodehelper_disable();
	device_shutdown();
}
/**
 *	kernel_halt - halt the system
 *
 *	Shutdown everything and perform a clean system halt.
 */
void kernel_halt(void)
{
	kernel_shutdown_prepare(SYSTEM_HALT);
	syscore_shutdown();
	printk(KERN_EMERG "System halted.\n");
	kmsg_dump(KMSG_DUMP_HALT);
	machine_halt();
}

EXPORT_SYMBOL_GPL(kernel_halt);

/**
 *	kernel_power_off - power_off the system
 *
 *	Shutdown everything and perform a clean system power_off.
 */
void kernel_power_off(void)
{
	kernel_shutdown_prepare(SYSTEM_POWER_OFF);
	if (pm_power_off_prepare)
		pm_power_off_prepare();
	disable_nonboot_cpus();
	syscore_shutdown();
	printk(KERN_EMERG "Power down.\n");
	kmsg_dump(KMSG_DUMP_POWEROFF);
	machine_power_off();
}
EXPORT_SYMBOL_GPL(kernel_power_off);

static DEFINE_MUTEX(reboot_mutex);

/*
 * Reboot system call: for obvious reasons only root may call it,
 * and even root needs to set up some magic numbers in the registers
 * so that some mistake won't make this reboot the whole machine.
 * You can also set the meaning of the ctrl-alt-del-key here.
 *
 * reboot doesn't sync: do that yourself before calling this.
 */
SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
		void __user *, arg)
{
	char buffer[256];
	int ret =3D 0;

	/* We only trust the superuser with rebooting the system. */
	if (!capable(CAP_SYS_BOOT))
		return -EPERM;

	/* For safety, we require "magic" arguments. */
	if (magic1 !=3D LINUX_REBOOT_MAGIC1 ||
	    (magic2 !=3D LINUX_REBOOT_MAGIC2 &&
	                magic2 !=3D LINUX_REBOOT_MAGIC2A &&
			magic2 !=3D LINUX_REBOOT_MAGIC2B &&
	                magic2 !=3D LINUX_REBOOT_MAGIC2C))
		return -EINVAL;

	/*
	 * If pid namespaces are enabled and the current task is in a child
	 * pid_namespace, the command is handled by reboot_pid_ns() which will
	 * call do_exit().
	 */
	ret =3D reboot_pid_ns(task_active_pid_ns(current), cmd);
	if (ret)
		return ret;

	/* Instead of trying to make the power_off code look like
	 * halt when pm_power_off is not set do it the easy way.
	 */
	if ((cmd =3D=3D LINUX_REBOOT_CMD_POWER_OFF) && !pm_power_off)
		cmd =3D LINUX_REBOOT_CMD_HALT;

	mutex_lock(&reboot_mutex);
	switch (cmd) {
	case LINUX_REBOOT_CMD_RESTART:
		kernel_restart(NULL);
		break;

	case LINUX_REBOOT_CMD_CAD_ON:
		C_A_D =3D 1;
		break;

	case LINUX_REBOOT_CMD_CAD_OFF:
		C_A_D =3D 0;
		break;

	case LINUX_REBOOT_CMD_HALT:
		kernel_halt();
		do_exit(0);
		panic("cannot halt");

	case LINUX_REBOOT_CMD_POWER_OFF:
		kernel_power_off();
		do_exit(0);
		break;

	case LINUX_REBOOT_CMD_RESTART2:
		if (strncpy_from_user(&buffer[0], arg, sizeof(buffer) - 1) < 0) {
			ret =3D -EFAULT;
			break;
		}
		buffer[sizeof(buffer) - 1] =3D '\0';

		kernel_restart(buffer);
		break;

#ifdef CONFIG_KEXEC
	case LINUX_REBOOT_CMD_KEXEC:
		ret =3D kernel_kexec();
		break;
#endif

#ifdef CONFIG_HIBERNATION
	case LINUX_REBOOT_CMD_SW_SUSPEND:
		ret =3D hibernate();
		break;
#endif

	default:
		ret =3D -EINVAL;
		break;
	}
	mutex_unlock(&reboot_mutex);
	return ret;
}

static void deferred_cad(struct work_struct *dummy)
{
	kernel_restart(NULL);
}

/*
 * This function gets called by ctrl-alt-del - ie the keyboard interrupt.
 * As it's called within an interrupt, it may NOT sync: the only choice
 * is whether to reboot at once, or just ignore the ctrl-alt-del.
 */
void ctrl_alt_del(void)
{
	static DECLARE_WORK(cad_work, deferred_cad);

	if (C_A_D)
		schedule_work(&cad_work);
	else
		kill_cad_pid(SIGINT, 1);
}
=09
/*
 * Unprivileged users may change the real gid to the effective gid
 * or vice versa.  (BSD-style)
 *
 * If you set the real gid at all, or set the effective gid to a value not
 * equal to the real gid, then the saved gid is set to the new effective gi=
d.
 *
 * This makes it possible for a setgid program to completely drop its
 * privileges, which is often a useful assertion to make when you are doing
 * a security audit over a program.
 *
 * The general idea is that a program which uses just setregid() will be
 * 100% compatible with BSD.  A program which uses just setgid() will be
 * 100% compatible with POSIX with saved IDs.=20
 *
 * SMP: There are not races, the GIDs are checked only by filesystem
 *      operations (as far as semantic preservation is concerned).
 */
SYSCALL_DEFINE2(setregid, gid_t, rgid, gid_t, egid)
{
	struct user_namespace *ns =3D current_user_ns();
	const struct cred *old;
	struct cred *new;
	int retval;
	kgid_t krgid, kegid;

	krgid =3D make_kgid(ns, rgid);
	kegid =3D make_kgid(ns, egid);

	if ((rgid !=3D (gid_t) -1) && !gid_valid(krgid))
		return -EINVAL;
	if ((egid !=3D (gid_t) -1) && !gid_valid(kegid))
		return -EINVAL;

	new =3D prepare_creds();
	if (!new)
		return -ENOMEM;
	old =3D current_cred();

	retval =3D -EPERM;
	if (rgid !=3D (gid_t) -1) {
		if (gid_eq(old->gid, krgid) ||
		    gid_eq(old->egid, krgid) ||
		    nsown_capable(CAP_SETGID))
			new->gid =3D krgid;
		else
			goto error;
	}
	if (egid !=3D (gid_t) -1) {
		if (gid_eq(old->gid, kegid) ||
		    gid_eq(old->egid, kegid) ||
		    gid_eq(old->sgid, kegid) ||
		    nsown_capable(CAP_SETGID))
			new->egid =3D kegid;
		else
			goto error;
	}

	if (rgid !=3D (gid_t) -1 ||
	    (egid !=3D (gid_t) -1 && !gid_eq(kegid, old->gid)))
		new->sgid =3D new->egid;
	new->fsgid =3D new->egid;

	return commit_creds(new);

error:
	abort_creds(new);
	return retval;
}

/*
 * setgid() is implemented like SysV w/ SAVED_IDS=20
 *
 * SMP: Same implicit races as above.
 */
SYSCALL_DEFINE1(setgid, gid_t, gid)
{
	struct user_namespace *ns =3D current_user_ns();
	const struct cred *old;
	struct cred *new;
	int retval;
	kgid_t kgid;

	kgid =3D make_kgid(ns, gid);
	if (!gid_valid(kgid))
		return -EINVAL;

	new =3D prepare_creds();
	if (!new)
		return -ENOMEM;
	old =3D current_cred();

	retval =3D -EPERM;
	if (nsown_capable(CAP_SETGID))
		new->gid =3D new->egid =3D new->sgid =3D new->fsgid =3D kgid;
	else if (gid_eq(kgid, old->gid) || gid_eq(kgid, old->sgid))
		new->egid =3D new->fsgid =3D kgid;
	else
		goto error;

	return commit_creds(new);

error:
	abort_creds(new);
	return retval;
}

/*
 * change the user struct in a credentials set to match the new UID
 */
static int set_user(struct cred *new)
{
	struct user_struct *new_user;

	new_user =3D alloc_uid(new->uid);
	if (!new_user)
		return -EAGAIN;

	/*
	 * We don't fail in case of NPROC limit excess here because too many
	 * poorly written programs don't check set*uid() return code, assuming
	 * it never fails if called by root.  We may still enforce NPROC limit
	 * for programs doing set*uid()+execve() by harmlessly deferring the
	 * failure to the execve() stage.
	 */
	if (atomic_read(&new_user->processes) >=3D rlimit(RLIMIT_NPROC) &&
			new_user !=3D INIT_USER)
		current->flags |=3D PF_NPROC_EXCEEDED;
	else
		current->flags &=3D ~PF_NPROC_EXCEEDED;

	free_uid(new->user);
	new->user =3D new_user;
	return 0;
}

/*
 * Unprivileged users may change the real uid to the effective uid
 * or vice versa.  (BSD-style)
 *
 * If you set the real uid at all, or set the effective uid to a value not
 * equal to the real uid, then the saved uid is set to the new effective ui=
d.
 *
 * This makes it possible for a setuid program to completely drop its
 * privileges, which is often a useful assertion to make when you are doing
 * a security audit over a program.
 *
 * The general idea is that a program which uses just setreuid() will be
 * 100% compatible with BSD.  A program which uses just setuid() will be
 * 100% compatible with POSIX with saved IDs.=20
 */
SYSCALL_DEFINE2(setreuid, uid_t, ruid, uid_t, euid)
{
	struct user_namespace *ns =3D current_user_ns();
	const struct cred *old;
	struct cred *new;
	int retval;
	kuid_t kruid, keuid;

	kruid =3D make_kuid(ns, ruid);
	keuid =3D make_kuid(ns, euid);

	if ((ruid !=3D (uid_t) -1) && !uid_valid(kruid))
		return -EINVAL;
	if ((euid !=3D (uid_t) -1) && !uid_valid(keuid))
		return -EINVAL;

	new =3D prepare_creds();
	if (!new)
		return -ENOMEM;
	old =3D current_cred();

	retval =3D -EPERM;
	if (ruid !=3D (uid_t) -1) {
		new->uid =3D kruid;
		if (!uid_eq(old->uid, kruid) &&
		    !uid_eq(old->euid, kruid) &&
		    !nsown_capable(CAP_SETUID))
			goto error;
	}

	if (euid !=3D (uid_t) -1) {
		new->euid =3D keuid;
		if (!uid_eq(old->uid, keuid) &&
		    !uid_eq(old->euid, keuid) &&
		    !uid_eq(old->suid, keuid) &&
		    !nsown_capable(CAP_SETUID))
			goto error;
	}

	if (!uid_eq(new->uid, old->uid)) {
		retval =3D set_user(new);
		if (retval < 0)
			goto error;
	}
	if (ruid !=3D (uid_t) -1 ||
	    (euid !=3D (uid_t) -1 && !uid_eq(keuid, old->uid)))
		new->suid =3D new->euid;
	new->fsuid =3D new->euid;

	retval =3D security_task_fix_setuid(new, old, LSM_SETID_RE);
	if (retval < 0)
		goto error;

	return commit_creds(new);

error:
	abort_creds(new);
	return retval;
}
	=09
/*
 * setuid() is implemented like SysV with SAVED_IDS=20
 *=20
 * Note that SAVED_ID's is deficient in that a setuid root program
 * like sendmail, for example, cannot set its uid to be a normal=20
 * user and then switch back, because if you're root, setuid() sets
 * the saved uid too.  If you don't like this, blame the bright people
 * in the POSIX committee and/or USG.  Note that the BSD-style setreuid()
 * will allow a root program to temporarily drop privileges and be able to
 * regain them by swapping the real and effective uid. =20
 */
SYSCALL_DEFINE1(setuid, uid_t, uid)
{
	struct user_namespace *ns =3D current_user_ns();
	const struct cred *old;
	struct cred *new;
	int retval;
	kuid_t kuid;

	kuid =3D make_kuid(ns, uid);
	if (!uid_valid(kuid))
		return -EINVAL;

	new =3D prepare_creds();
	if (!new)
		return -ENOMEM;
	old =3D current_cred();

	retval =3D -EPERM;
	if (nsown_capable(CAP_SETUID)) {
		new->suid =3D new->uid =3D kuid;
		if (!uid_eq(kuid, old->uid)) {
			retval =3D set_user(new);
			if (retval < 0)
				goto error;
		}
	} else if (!uid_eq(kuid, old->uid) && !uid_eq(kuid, new->suid)) {
		goto error;
	}

	new->fsuid =3D new->euid =3D kuid;

	retval =3D security_task_fix_setuid(new, old, LSM_SETID_ID);
	if (retval < 0)
		goto error;

	return commit_creds(new);

error:
	abort_creds(new);
	return retval;
}


/*
 * This function implements a generic ability to update ruid, euid,
 * and suid.  This allows you to implement the 4.4 compatible seteuid().
 */
SYSCALL_DEFINE3(setresuid, uid_t, ruid, uid_t, euid, uid_t, suid)
{
	struct user_namespace *ns =3D current_user_ns();
	const struct cred *old;
	struct cred *new;
	int retval;
	kuid_t kruid, keuid, ksuid;

	kruid =3D make_kuid(ns, ruid);
	keuid =3D make_kuid(ns, euid);
	ksuid =3D make_kuid(ns, suid);

	if ((ruid !=3D (uid_t) -1) && !uid_valid(kruid))
		return -EINVAL;

	if ((euid !=3D (uid_t) -1) && !uid_valid(keuid))
		return -EINVAL;

	if ((suid !=3D (uid_t) -1) && !uid_valid(ksuid))
		return -EINVAL;

	new =3D prepare_creds();
	if (!new)
		return -ENOMEM;

	old =3D current_cred();

	retval =3D -EPERM;
	if (!nsown_capable(CAP_SETUID)) {
		if (ruid !=3D (uid_t) -1        && !uid_eq(kruid, old->uid) &&
		    !uid_eq(kruid, old->euid) && !uid_eq(kruid, old->suid))
			goto error;
		if (euid !=3D (uid_t) -1        && !uid_eq(keuid, old->uid) &&
		    !uid_eq(keuid, old->euid) && !uid_eq(keuid, old->suid))
			goto error;
		if (suid !=3D (uid_t) -1        && !uid_eq(ksuid, old->uid) &&
		    !uid_eq(ksuid, old->euid) && !uid_eq(ksuid, old->suid))
			goto error;
	}

	if (ruid !=3D (uid_t) -1) {
		new->uid =3D kruid;
		if (!uid_eq(kruid, old->uid)) {
			retval =3D set_user(new);
			if (retval < 0)
				goto error;
		}
	}
	if (euid !=3D (uid_t) -1)
		new->euid =3D keuid;
	if (suid !=3D (uid_t) -1)
		new->suid =3D ksuid;
	new->fsuid =3D new->euid;

	retval =3D security_task_fix_setuid(new, old, LSM_SETID_RES);
	if (retval < 0)
		goto error;

	return commit_creds(new);

error:
	abort_creds(new);
	return retval;
}

SYSCALL_DEFINE3(getresuid, uid_t __user *, ruidp, uid_t __user *, euidp, ui=
d_t __user *, suidp)
{
	const struct cred *cred =3D current_cred();
	int retval;
	uid_t ruid, euid, suid;

	ruid =3D from_kuid_munged(cred->user_ns, cred->uid);
	euid =3D from_kuid_munged(cred->user_ns, cred->euid);
	suid =3D from_kuid_munged(cred->user_ns, cred->suid);

	if (!(retval   =3D put_user(ruid, ruidp)) &&
	    !(retval   =3D put_user(euid, euidp)))
		retval =3D put_user(suid, suidp);

	return retval;
}

/*
 * Same as above, but for rgid, egid, sgid.
 */
SYSCALL_DEFINE3(setresgid, gid_t, rgid, gid_t, egid, gid_t, sgid)
{
	struct user_namespace *ns =3D current_user_ns();
	const struct cred *old;
	struct cred *new;
	int retval;
	kgid_t krgid, kegid, ksgid;

	krgid =3D make_kgid(ns, rgid);
	kegid =3D make_kgid(ns, egid);
	ksgid =3D make_kgid(ns, sgid);

	if ((rgid !=3D (gid_t) -1) && !gid_valid(krgid))
		return -EINVAL;
	if ((egid !=3D (gid_t) -1) && !gid_valid(kegid))
		return -EINVAL;
	if ((sgid !=3D (gid_t) -1) && !gid_valid(ksgid))
		return -EINVAL;

	new =3D prepare_creds();
	if (!new)
		return -ENOMEM;
	old =3D current_cred();

	retval =3D -EPERM;
	if (!nsown_capable(CAP_SETGID)) {
		if (rgid !=3D (gid_t) -1        && !gid_eq(krgid, old->gid) &&
		    !gid_eq(krgid, old->egid) && !gid_eq(krgid, old->sgid))
			goto error;
		if (egid !=3D (gid_t) -1        && !gid_eq(kegid, old->gid) &&
		    !gid_eq(kegid, old->egid) && !gid_eq(kegid, old->sgid))
			goto error;
		if (sgid !=3D (gid_t) -1        && !gid_eq(ksgid, old->gid) &&
		    !gid_eq(ksgid, old->egid) && !gid_eq(ksgid, old->sgid))
			goto error;
	}

	if (rgid !=3D (gid_t) -1)
		new->gid =3D krgid;
	if (egid !=3D (gid_t) -1)
		new->egid =3D kegid;
	if (sgid !=3D (gid_t) -1)
		new->sgid =3D ksgid;
	new->fsgid =3D new->egid;

	return commit_creds(new);

error:
	abort_creds(new);
	return retval;
}

SYSCALL_DEFINE3(getresgid, gid_t __user *, rgidp, gid_t __user *, egidp, gi=
d_t __user *, sgidp)
{
	const struct cred *cred =3D current_cred();
	int retval;
	gid_t rgid, egid, sgid;

	rgid =3D from_kgid_munged(cred->user_ns, cred->gid);
	egid =3D from_kgid_munged(cred->user_ns, cred->egid);
	sgid =3D from_kgid_munged(cred->user_ns, cred->sgid);

	if (!(retval   =3D put_user(rgid, rgidp)) &&
	    !(retval   =3D put_user(egid, egidp)))
		retval =3D put_user(sgid, sgidp);

	return retval;
}


/*
 * "setfsuid()" sets the fsuid - the uid used for filesystem checks. This
 * is used for "access()" and for the NFS daemon (letting nfsd stay at
 * whatever uid it wants to). It normally shadows "euid", except when
 * explicitly set by setfsuid() or for access..
 */
SYSCALL_DEFINE1(setfsuid, uid_t, uid)
{
	const struct cred *old;
	struct cred *new;
	uid_t old_fsuid;
	kuid_t kuid;

	old =3D current_cred();
	old_fsuid =3D from_kuid_munged(old->user_ns, old->fsuid);

	kuid =3D make_kuid(old->user_ns, uid);
	if (!uid_valid(kuid))
		return old_fsuid;

	new =3D prepare_creds();
	if (!new)
		return old_fsuid;

	if (uid_eq(kuid, old->uid)  || uid_eq(kuid, old->euid)  ||
	    uid_eq(kuid, old->suid) || uid_eq(kuid, old->fsuid) ||
	    nsown_capable(CAP_SETUID)) {
		if (!uid_eq(kuid, old->fsuid)) {
			new->fsuid =3D kuid;
			if (security_task_fix_setuid(new, old, LSM_SETID_FS) =3D=3D 0)
				goto change_okay;
		}
	}

	abort_creds(new);
	return old_fsuid;

change_okay:
	commit_creds(new);
	return old_fsuid;
}

/*
 * Samma p=E5 svenska..
 */
SYSCALL_DEFINE1(setfsgid, gid_t, gid)
{
	const struct cred *old;
	struct cred *new;
	gid_t old_fsgid;
	kgid_t kgid;

	old =3D current_cred();
	old_fsgid =3D from_kgid_munged(old->user_ns, old->fsgid);

	kgid =3D make_kgid(old->user_ns, gid);
	if (!gid_valid(kgid))
		return old_fsgid;

	new =3D prepare_creds();
	if (!new)
		return old_fsgid;

	if (gid_eq(kgid, old->gid)  || gid_eq(kgid, old->egid)  ||
	    gid_eq(kgid, old->sgid) || gid_eq(kgid, old->fsgid) ||
	    nsown_capable(CAP_SETGID)) {
		if (!gid_eq(kgid, old->fsgid)) {
			new->fsgid =3D kgid;
			goto change_okay;
		}
	}

	abort_creds(new);
	return old_fsgid;

change_okay:
	commit_creds(new);
	return old_fsgid;
}

void do_sys_times(struct tms *tms)
{
	cputime_t tgutime, tgstime, cutime, cstime;

	spin_lock_irq(&current->sighand->siglock);
	thread_group_times(current, &tgutime, &tgstime);
	cutime =3D current->signal->cutime;
	cstime =3D current->signal->cstime;
	spin_unlock_irq(&current->sighand->siglock);
	tms->tms_utime =3D cputime_to_clock_t(tgutime);
	tms->tms_stime =3D cputime_to_clock_t(tgstime);
	tms->tms_cutime =3D cputime_to_clock_t(cutime);
	tms->tms_cstime =3D cputime_to_clock_t(cstime);
}

SYSCALL_DEFINE1(times, struct tms __user *, tbuf)
{
	if (tbuf) {
		struct tms tmp;

		do_sys_times(&tmp);
		if (copy_to_user(tbuf, &tmp, sizeof(struct tms)))
			return -EFAULT;
	}
	force_successful_syscall_return();
	return (long) jiffies_64_to_clock_t(get_jiffies_64());
}

/*
 * This needs some heavy checking ...
 * I just haven't the stomach for it. I also don't fully
 * understand sessions/pgrp etc. Let somebody who does explain it.
 *
 * OK, I think I have the protection semantics right.... this is really
 * only important on a multi-user system anyway, to make sure one user
 * can't send a signal to a process owned by another.  -TYT, 12/12/91
 *
 * Auch. Had to add the 'did_exec' flag to conform completely to POSIX.
 * LBT 04.03.94
 */
SYSCALL_DEFINE2(setpgid, pid_t, pid, pid_t, pgid)
{
	struct task_struct *p;
	struct task_struct *group_leader =3D current->group_leader;
	struct pid *pgrp;
	int err;

	if (!pid)
		pid =3D task_pid_vnr(group_leader);
	if (!pgid)
		pgid =3D pid;
	if (pgid < 0)
		return -EINVAL;
	rcu_read_lock();

	/* From this point forward we keep holding onto the tasklist lock
	 * so that our parent does not change from under us. -DaveM
	 */
	write_lock_irq(&tasklist_lock);

	err =3D -ESRCH;
	p =3D find_task_by_vpid(pid);
	if (!p)
		goto out;

	err =3D -EINVAL;
	if (!thread_group_leader(p))
		goto out;

	if (same_thread_group(p->real_parent, group_leader)) {
		err =3D -EPERM;
		if (task_session(p) !=3D task_session(group_leader))
			goto out;
		err =3D -EACCES;
		if (p->did_exec)
			goto out;
	} else {
		err =3D -ESRCH;
		if (p !=3D group_leader)
			goto out;
	}

	err =3D -EPERM;
	if (p->signal->leader)
		goto out;

	pgrp =3D task_pid(p);
	if (pgid !=3D pid) {
		struct task_struct *g;

		pgrp =3D find_vpid(pgid);
		g =3D pid_task(pgrp, PIDTYPE_PGID);
		if (!g || task_session(g) !=3D task_session(group_leader))
			goto out;
	}

	err =3D security_task_setpgid(p, pgid);
	if (err)
		goto out;

	if (task_pgrp(p) !=3D pgrp)
		change_pid(p, PIDTYPE_PGID, pgrp);

	err =3D 0;
out:
	/* All paths lead to here, thus we are safe. -DaveM */
	write_unlock_irq(&tasklist_lock);
	rcu_read_unlock();
	return err;
}

SYSCALL_DEFINE1(getpgid, pid_t, pid)
{
	struct task_struct *p;
	struct pid *grp;
	int retval;

	rcu_read_lock();
	if (!pid)
		grp =3D task_pgrp(current);
	else {
		retval =3D -ESRCH;
		p =3D find_task_by_vpid(pid);
		if (!p)
			goto out;
		grp =3D task_pgrp(p);
		if (!grp)
			goto out;

		retval =3D security_task_getpgid(p);
		if (retval)
			goto out;
	}
	retval =3D pid_vnr(grp);
out:
	rcu_read_unlock();
	return retval;
}

#ifdef __ARCH_WANT_SYS_GETPGRP

SYSCALL_DEFINE0(getpgrp)
{
	return sys_getpgid(0);
}

#endif

SYSCALL_DEFINE1(getsid, pid_t, pid)
{
	struct task_struct *p;
	struct pid *sid;
	int retval;

	rcu_read_lock();
	if (!pid)
		sid =3D task_session(current);
	else {
		retval =3D -ESRCH;
		p =3D find_task_by_vpid(pid);
		if (!p)
			goto out;
		sid =3D task_session(p);
		if (!sid)
			goto out;

		retval =3D security_task_getsid(p);
		if (retval)
			goto out;
	}
	retval =3D pid_vnr(sid);
out:
	rcu_read_unlock();
	return retval;
}

SYSCALL_DEFINE0(setsid)
{
	struct task_struct *group_leader =3D current->group_leader;
	struct pid *sid =3D task_pid(group_leader);
	pid_t session =3D pid_vnr(sid);
	int err =3D -EPERM;

	write_lock_irq(&tasklist_lock);
	/* Fail if I am already a session leader */
	if (group_leader->signal->leader)
		goto out;

	/* Fail if a process group id already exists that equals the
	 * proposed session id.
	 */
	if (pid_task(sid, PIDTYPE_PGID))
		goto out;

	group_leader->signal->leader =3D 1;
	__set_special_pids(sid);

	proc_clear_tty(group_leader);

	err =3D session;
out:
	write_unlock_irq(&tasklist_lock);
	if (err > 0) {
		proc_sid_connector(group_leader);
		sched_autogroup_create_attach(group_leader);
	}
	return err;
}

DECLARE_RWSEM(uts_sem);

#ifdef COMPAT_UTS_MACHINE
#define override_architecture(name) \
	(personality(current->personality) =3D=3D PER_LINUX32 && \
	 copy_to_user(name->machine, COMPAT_UTS_MACHINE, \
		      sizeof(COMPAT_UTS_MACHINE)))
#else
#define override_architecture(name)	0
#endif

/*
 * Work around broken programs that cannot handle "Linux 3.0".
 * Instead we map 3.x to 2.6.40+x, so e.g. 3.0 would be 2.6.40
 */
static int override_release(char __user *release, int len)
{
	int ret =3D 0;
	char buf[65];

	if (current->personality & UNAME26) {
		char *rest =3D UTS_RELEASE;
		int ndots =3D 0;
		unsigned v;

		while (*rest) {
			if (*rest =3D=3D '.' && ++ndots >=3D 3)
				break;
			if (!isdigit(*rest) && *rest !=3D '.')
				break;
			rest++;
		}
		v =3D ((LINUX_VERSION_CODE >> 8) & 0xff) + 40;
		snprintf(buf, len, "2.6.%u%s", v, rest);
		ret =3D copy_to_user(release, buf, len);
	}
	return ret;
}

SYSCALL_DEFINE1(newuname, struct new_utsname __user *, name)
{
	int errno =3D 0;

	down_read(&uts_sem);
	if (copy_to_user(name, utsname(), sizeof *name))
		errno =3D -EFAULT;
	up_read(&uts_sem);

	if (!errno && override_release(name->release, sizeof(name->release)))
		errno =3D -EFAULT;
	if (!errno && override_architecture(name))
		errno =3D -EFAULT;
	return errno;
}

#ifdef __ARCH_WANT_SYS_OLD_UNAME
/*
 * Old cruft
 */
SYSCALL_DEFINE1(uname, struct old_utsname __user *, name)
{
	int error =3D 0;

	if (!name)
		return -EFAULT;

	down_read(&uts_sem);
	if (copy_to_user(name, utsname(), sizeof(*name)))
		error =3D -EFAULT;
	up_read(&uts_sem);

	if (!error && override_release(name->release, sizeof(name->release)))
		error =3D -EFAULT;
	if (!error && override_architecture(name))
		error =3D -EFAULT;
	return error;
}

SYSCALL_DEFINE1(olduname, struct oldold_utsname __user *, name)
{
	int error;

	if (!name)
		return -EFAULT;
	if (!access_ok(VERIFY_WRITE, name, sizeof(struct oldold_utsname)))
		return -EFAULT;

	down_read(&uts_sem);
	error =3D __copy_to_user(&name->sysname, &utsname()->sysname,
			       __OLD_UTS_LEN);
	error |=3D __put_user(0, name->sysname + __OLD_UTS_LEN);
	error |=3D __copy_to_user(&name->nodename, &utsname()->nodename,
				__OLD_UTS_LEN);
	error |=3D __put_user(0, name->nodename + __OLD_UTS_LEN);
	error |=3D __copy_to_user(&name->release, &utsname()->release,
				__OLD_UTS_LEN);
	error |=3D __put_user(0, name->release + __OLD_UTS_LEN);
	error |=3D __copy_to_user(&name->version, &utsname()->version,
				__OLD_UTS_LEN);
	error |=3D __put_user(0, name->version + __OLD_UTS_LEN);
	error |=3D __copy_to_user(&name->machine, &utsname()->machine,
				__OLD_UTS_LEN);
	error |=3D __put_user(0, name->machine + __OLD_UTS_LEN);
	up_read(&uts_sem);

	if (!error && override_architecture(name))
		error =3D -EFAULT;
	if (!error && override_release(name->release, sizeof(name->release)))
		error =3D -EFAULT;
	return error ? -EFAULT : 0;
}
#endif

SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
{
	int errno;
	char tmp[__NEW_UTS_LEN];

	if (!ns_capable(current->nsproxy->uts_ns->user_ns, CAP_SYS_ADMIN))
		return -EPERM;

	if (len < 0 || len > __NEW_UTS_LEN)
		return -EINVAL;
	down_write(&uts_sem);
	errno =3D -EFAULT;
	if (!copy_from_user(tmp, name, len)) {
		struct new_utsname *u =3D utsname();

		memcpy(u->nodename, tmp, len);
		memset(u->nodename + len, 0, sizeof(u->nodename) - len);
		errno =3D 0;
		uts_proc_notify(UTS_PROC_HOSTNAME);
	}
	up_write(&uts_sem);
	return errno;
}

#ifdef __ARCH_WANT_SYS_GETHOSTNAME

SYSCALL_DEFINE2(gethostname, char __user *, name, int, len)
{
	int i, errno;
	struct new_utsname *u;

	if (len < 0)
		return -EINVAL;
	down_read(&uts_sem);
	u =3D utsname();
	i =3D 1 + strlen(u->nodename);
	if (i > len)
		i =3D len;
	errno =3D 0;
	if (copy_to_user(name, u->nodename, i))
		errno =3D -EFAULT;
	up_read(&uts_sem);
	return errno;
}

#endif

/*
 * Only setdomainname; getdomainname can be implemented by calling
 * uname()
 */
SYSCALL_DEFINE2(setdomainname, char __user *, name, int, len)
{
	int errno;
	char tmp[__NEW_UTS_LEN];

	if (!ns_capable(current->nsproxy->uts_ns->user_ns, CAP_SYS_ADMIN))
		return -EPERM;
	if (len < 0 || len > __NEW_UTS_LEN)
		return -EINVAL;

	down_write(&uts_sem);
	errno =3D -EFAULT;
	if (!copy_from_user(tmp, name, len)) {
		struct new_utsname *u =3D utsname();

		memcpy(u->domainname, tmp, len);
		memset(u->domainname + len, 0, sizeof(u->domainname) - len);
		errno =3D 0;
		uts_proc_notify(UTS_PROC_DOMAINNAME);
	}
	up_write(&uts_sem);
	return errno;
}

SYSCALL_DEFINE2(getrlimit, unsigned int, resource, struct rlimit __user *, =
rlim)
{
	struct rlimit value;
	int ret;

	ret =3D do_prlimit(current, resource, NULL, &value);
	if (!ret)
		ret =3D copy_to_user(rlim, &value, sizeof(*rlim)) ? -EFAULT : 0;

	return ret;
}

#ifdef __ARCH_WANT_SYS_OLD_GETRLIMIT

/*
 *	Back compatibility for getrlimit. Needed for some apps.
 */
=20
SYSCALL_DEFINE2(old_getrlimit, unsigned int, resource,
		struct rlimit __user *, rlim)
{
	struct rlimit x;
	if (resource >=3D RLIM_NLIMITS)
		return -EINVAL;

	task_lock(current->group_leader);
	x =3D current->signal->rlim[resource];
	task_unlock(current->group_leader);
	if (x.rlim_cur > 0x7FFFFFFF)
		x.rlim_cur =3D 0x7FFFFFFF;
	if (x.rlim_max > 0x7FFFFFFF)
		x.rlim_max =3D 0x7FFFFFFF;
	return copy_to_user(rlim, &x, sizeof(x))?-EFAULT:0;
}

#endif

static inline bool rlim64_is_infinity(__u64 rlim64)
{
#if BITS_PER_LONG < 64
	return rlim64 >=3D ULONG_MAX;
#else
	return rlim64 =3D=3D RLIM64_INFINITY;
#endif
}

static void rlim_to_rlim64(const struct rlimit *rlim, struct rlimit64 *rlim=
64)
{
	if (rlim->rlim_cur =3D=3D RLIM_INFINITY)
		rlim64->rlim_cur =3D RLIM64_INFINITY;
	else
		rlim64->rlim_cur =3D rlim->rlim_cur;
	if (rlim->rlim_max =3D=3D RLIM_INFINITY)
		rlim64->rlim_max =3D RLIM64_INFINITY;
	else
		rlim64->rlim_max =3D rlim->rlim_max;
}

static void rlim64_to_rlim(const struct rlimit64 *rlim64, struct rlimit *rl=
im)
{
	if (rlim64_is_infinity(rlim64->rlim_cur))
		rlim->rlim_cur =3D RLIM_INFINITY;
	else
		rlim->rlim_cur =3D (unsigned long)rlim64->rlim_cur;
	if (rlim64_is_infinity(rlim64->rlim_max))
		rlim->rlim_max =3D RLIM_INFINITY;
	else
		rlim->rlim_max =3D (unsigned long)rlim64->rlim_max;
}

/* make sure you are allowed to change @tsk limits before calling this */
int do_prlimit(struct task_struct *tsk, unsigned int resource,
		struct rlimit *new_rlim, struct rlimit *old_rlim)
{
	struct rlimit *rlim;
	int retval =3D 0;

	if (resource >=3D RLIM_NLIMITS)
		return -EINVAL;
	if (new_rlim) {
		if (new_rlim->rlim_cur > new_rlim->rlim_max)
			return -EINVAL;
		if (resource =3D=3D RLIMIT_NOFILE &&
				new_rlim->rlim_max > sysctl_nr_open)
			return -EPERM;
	}

	/* protect tsk->signal and tsk->sighand from disappearing */
	read_lock(&tasklist_lock);
	if (!tsk->sighand) {
		retval =3D -ESRCH;
		goto out;
	}

	rlim =3D tsk->signal->rlim + resource;
	task_lock(tsk->group_leader);
	if (new_rlim) {
		/* Keep the capable check against init_user_ns until
		   cgroups can contain all limits */
		if (new_rlim->rlim_max > rlim->rlim_max &&
				!capable(CAP_SYS_RESOURCE))
			retval =3D -EPERM;
		if (!retval)
			retval =3D security_task_setrlimit(tsk->group_leader,
					resource, new_rlim);
		if (resource =3D=3D RLIMIT_CPU && new_rlim->rlim_cur =3D=3D 0) {
			/*
			 * The caller is asking for an immediate RLIMIT_CPU
			 * expiry.  But we use the zero value to mean "it was
			 * never set".  So let's cheat and make it one second
			 * instead
			 */
			new_rlim->rlim_cur =3D 1;
		}
	}
	if (!retval) {
		if (old_rlim)
			*old_rlim =3D *rlim;
		if (new_rlim)
			*rlim =3D *new_rlim;
	}
	task_unlock(tsk->group_leader);

	/*
	 * RLIMIT_CPU handling.   Note that the kernel fails to return an error
	 * code if it rejected the user's attempt to set RLIMIT_CPU.  This is a
	 * very long-standing error, and fixing it now risks breakage of
	 * applications, so we live with it
	 */
	 if (!retval && new_rlim && resource =3D=3D RLIMIT_CPU &&
			 new_rlim->rlim_cur !=3D RLIM_INFINITY)
		update_rlimit_cpu(tsk, new_rlim->rlim_cur);
out:
	read_unlock(&tasklist_lock);
	return retval;
}

/* rcu lock must be held */
static int check_prlimit_permission(struct task_struct *task)
{
	const struct cred *cred =3D current_cred(), *tcred;

	if (current =3D=3D task)
		return 0;

	tcred =3D __task_cred(task);
	if (uid_eq(cred->uid, tcred->euid) &&
	    uid_eq(cred->uid, tcred->suid) &&
	    uid_eq(cred->uid, tcred->uid)  &&
	    gid_eq(cred->gid, tcred->egid) &&
	    gid_eq(cred->gid, tcred->sgid) &&
	    gid_eq(cred->gid, tcred->gid))
		return 0;
	if (ns_capable(tcred->user_ns, CAP_SYS_RESOURCE))
		return 0;

	return -EPERM;
}

SYSCALL_DEFINE4(prlimit64, pid_t, pid, unsigned int, resource,
		const struct rlimit64 __user *, new_rlim,
		struct rlimit64 __user *, old_rlim)
{
	struct rlimit64 old64, new64;
	struct rlimit old, new;
	struct task_struct *tsk;
	int ret;

	if (new_rlim) {
		if (copy_from_user(&new64, new_rlim, sizeof(new64)))
			return -EFAULT;
		rlim64_to_rlim(&new64, &new);
	}

	rcu_read_lock();
	tsk =3D pid ? find_task_by_vpid(pid) : current;
	if (!tsk) {
		rcu_read_unlock();
		return -ESRCH;
	}
	ret =3D check_prlimit_permission(tsk);
	if (ret) {
		rcu_read_unlock();
		return ret;
	}
	get_task_struct(tsk);
	rcu_read_unlock();

	ret =3D do_prlimit(tsk, resource, new_rlim ? &new : NULL,
			old_rlim ? &old : NULL);

	if (!ret && old_rlim) {
		rlim_to_rlim64(&old, &old64);
		if (copy_to_user(old_rlim, &old64, sizeof(old64)))
			ret =3D -EFAULT;
	}

	put_task_struct(tsk);
	return ret;
}

SYSCALL_DEFINE2(setrlimit, unsigned int, resource, struct rlimit __user *, =
rlim)
{
	struct rlimit new_rlim;

	if (copy_from_user(&new_rlim, rlim, sizeof(*rlim)))
		return -EFAULT;
	return do_prlimit(current, resource, &new_rlim, NULL);
}

/*
 * It would make sense to put struct rusage in the task_struct,
 * except that would make the task_struct be *really big*.  After
 * task_struct gets moved into malloc'ed memory, it would
 * make sense to do this.  It will make moving the rest of the information
 * a lot simpler!  (Which we're not doing right now because we're not
 * measuring them yet).
 *
 * When sampling multiple threads for RUSAGE_SELF, under SMP we might have
 * races with threads incrementing their own counters.  But since word
 * reads are atomic, we either get new values or old values and we don't
 * care which for the sums.  We always take the siglock to protect reading
 * the c* fields from p->signal from races with exit.c updating those
 * fields when reaping, so a sample either gets all the additions of a
 * given child after it's reaped, or none so this sample is before reaping.
 *
 * Locking:
 * We need to take the siglock for CHILDEREN, SELF and BOTH
 * for  the cases current multithreaded, non-current single threaded
 * non-current multithreaded.  Thread traversal is now safe with
 * the siglock held.
 * Strictly speaking, we donot need to take the siglock if we are current a=
nd
 * single threaded,  as no one else can take our signal_struct away, no one
 * else can  reap the  children to update signal->c* counters, and no one e=
lse
 * can race with the signal-> fields. If we do not take any lock, the
 * signal-> fields could be read out of order while another thread was just
 * exiting. So we should  place a read memory barrier when we avoid the loc=
k.
 * On the writer side,  write memory barrier is implied in  __exit_signal
 * as __exit_signal releases  the siglock spinlock after updating the signa=
l->
 * fields. But we don't do this yet to keep things simple.
 *
 */

static void accumulate_thread_rusage(struct task_struct *t, struct rusage *=
r)
{
	r->ru_nvcsw +=3D t->nvcsw;
	r->ru_nivcsw +=3D t->nivcsw;
	r->ru_minflt +=3D t->min_flt;
	r->ru_majflt +=3D t->maj_flt;
	r->ru_inblock +=3D task_io_get_inblock(t);
	r->ru_oublock +=3D task_io_get_oublock(t);
}

static void k_getrusage(struct task_struct *p, int who, struct rusage *r)
{
	struct task_struct *t;
	unsigned long flags;
	cputime_t tgutime, tgstime, utime, stime;
	unsigned long maxrss =3D 0;

	memset((char *) r, 0, sizeof *r);
	utime =3D stime =3D 0;

	if (who =3D=3D RUSAGE_THREAD) {
		task_times(current, &utime, &stime);
		accumulate_thread_rusage(p, r);
		maxrss =3D p->signal->maxrss;
		goto out;
	}

	if (!lock_task_sighand(p, &flags))
		return;

	switch (who) {
		case RUSAGE_BOTH:
		case RUSAGE_CHILDREN:
			utime =3D p->signal->cutime;
			stime =3D p->signal->cstime;
			r->ru_nvcsw =3D p->signal->cnvcsw;
			r->ru_nivcsw =3D p->signal->cnivcsw;
			r->ru_minflt =3D p->signal->cmin_flt;
			r->ru_majflt =3D p->signal->cmaj_flt;
			r->ru_inblock =3D p->signal->cinblock;
			r->ru_oublock =3D p->signal->coublock;
			maxrss =3D p->signal->cmaxrss;

			if (who =3D=3D RUSAGE_CHILDREN)
				break;

		case RUSAGE_SELF:
			thread_group_times(p, &tgutime, &tgstime);
			utime +=3D tgutime;
			stime +=3D tgstime;
			r->ru_nvcsw +=3D p->signal->nvcsw;
			r->ru_nivcsw +=3D p->signal->nivcsw;
			r->ru_minflt +=3D p->signal->min_flt;
			r->ru_majflt +=3D p->signal->maj_flt;
			r->ru_inblock +=3D p->signal->inblock;
			r->ru_oublock +=3D p->signal->oublock;
			if (maxrss < p->signal->maxrss)
				maxrss =3D p->signal->maxrss;
			t =3D p;
			do {
				accumulate_thread_rusage(t, r);
				t =3D next_thread(t);
			} while (t !=3D p);
			break;

		default:
			BUG();
	}
	unlock_task_sighand(p, &flags);

out:
	cputime_to_timeval(utime, &r->ru_utime);
	cputime_to_timeval(stime, &r->ru_stime);

	if (who !=3D RUSAGE_CHILDREN) {
		struct mm_struct *mm =3D get_task_mm(p);
		if (mm) {
			setmax_mm_hiwater_rss(&maxrss, mm);
			mmput(mm);
		}
	}
	r->ru_maxrss =3D maxrss * (PAGE_SIZE / 1024); /* convert pages to KBs */
}

int getrusage(struct task_struct *p, int who, struct rusage __user *ru)
{
	struct rusage r;
	k_getrusage(p, who, &r);
	return copy_to_user(ru, &r, sizeof(r)) ? -EFAULT : 0;
}

SYSCALL_DEFINE2(getrusage, int, who, struct rusage __user *, ru)
{
	if (who !=3D RUSAGE_SELF && who !=3D RUSAGE_CHILDREN &&
	    who !=3D RUSAGE_THREAD)
		return -EINVAL;
	return getrusage(current, who, ru);
}

SYSCALL_DEFINE1(umask, int, mask)
{
	mask =3D xchg(&current->fs->umask, mask & S_IRWXUGO);
	return mask;
}

#ifdef CONFIG_CHECKPOINT_RESTORE
static int prctl_set_mm_exe_file(struct mm_struct *mm, unsigned int fd)
{
	struct fd exe;
	struct dentry *dentry;
	int err;

	exe =3D fdget(fd);
	if (!exe.file)
		return -EBADF;

	dentry =3D exe.file->f_path.dentry;

	/*
	 * Because the original mm->exe_file points to executable file, make
	 * sure that this one is executable as well, to avoid breaking an
	 * overall picture.
	 */
	err =3D -EACCES;
	if (!S_ISREG(dentry->d_inode->i_mode)	||
	    exe.file->f_path.mnt->mnt_flags & MNT_NOEXEC)
		goto exit;

	err =3D inode_permission(dentry->d_inode, MAY_EXEC);
	if (err)
		goto exit;

	down_write(&mm->mmap_sem);

	/*
	 * Forbid mm->exe_file change if old file still mapped.
	 */
	err =3D -EBUSY;
	if (mm->exe_file) {
		struct vm_area_struct *vma;

		for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
			if (vma->vm_file &&
			    path_equal(&vma->vm_file->f_path,
				       &mm->exe_file->f_path))
				goto exit_unlock;
	}

	/*
	 * The symlink can be changed only once, just to disallow arbitrary
	 * transitions malicious software might bring in. This means one
	 * could make a snapshot over all processes running and monitor
	 * /proc/pid/exe changes to notice unusual activity if needed.
	 */
	err =3D -EPERM;
	if (test_and_set_bit(MMF_EXE_FILE_CHANGED, &mm->flags))
		goto exit_unlock;

	err =3D 0;
	set_mm_exe_file(mm, exe.file);	/* this grabs a reference to exe.file */
exit_unlock:
	up_write(&mm->mmap_sem);

exit:
	fdput(exe);
	return err;
}

static int prctl_set_mm(int opt, unsigned long addr,
			unsigned long arg4, unsigned long arg5)
{
	unsigned long rlim =3D rlimit(RLIMIT_DATA);
	struct mm_struct *mm =3D current->mm;
	struct vm_area_struct *vma;
	int error;

	if (arg5 || (arg4 && opt !=3D PR_SET_MM_AUXV))
		return -EINVAL;

	if (!capable(CAP_SYS_RESOURCE))
		return -EPERM;

	if (opt =3D=3D PR_SET_MM_EXE_FILE)
		return prctl_set_mm_exe_file(mm, (unsigned int)addr);

	if (!access_ok(VERIFY_READ, addr, sizeof(addr)) || addr < mmap_min_addr)
		return -EINVAL;

	error =3D -EINVAL;

	down_read(&mm->mmap_sem);
	vma =3D find_vma(mm, addr);

	switch (opt) {
	case PR_SET_MM_START_CODE:
		mm->start_code =3D addr;
		break;
	case PR_SET_MM_END_CODE:
		mm->end_code =3D addr;
		break;
	case PR_SET_MM_START_DATA:
		mm->start_data =3D addr;
		break;
	case PR_SET_MM_END_DATA:
		mm->end_data =3D addr;
		break;

	case PR_SET_MM_START_BRK:
		if (addr <=3D mm->end_data)
			goto out;

		if (rlim < RLIM_INFINITY &&
		    (mm->brk - addr) +
		    (mm->end_data - mm->start_data) > rlim)
			goto out;

		mm->start_brk =3D addr;
		break;

	case PR_SET_MM_BRK:
		if (addr <=3D mm->end_data)
			goto out;

		if (rlim < RLIM_INFINITY &&
		    (addr - mm->start_brk) +
		    (mm->end_data - mm->start_data) > rlim)
			goto out;

		mm->brk =3D addr;
		break;

	/*
	 * If command line arguments and environment
	 * are placed somewhere else on stack, we can
	 * set them up here, ARG_START/END to setup
	 * command line argumets and ENV_START/END
	 * for environment.
	 */
	case PR_SET_MM_START_STACK:
	case PR_SET_MM_ARG_START:
	case PR_SET_MM_ARG_END:
	case PR_SET_MM_ENV_START:
	case PR_SET_MM_ENV_END:
		if (!vma) {
			error =3D -EFAULT;
			goto out;
		}
		if (opt =3D=3D PR_SET_MM_START_STACK)
			mm->start_stack =3D addr;
		else if (opt =3D=3D PR_SET_MM_ARG_START)
			mm->arg_start =3D addr;
		else if (opt =3D=3D PR_SET_MM_ARG_END)
			mm->arg_end =3D addr;
		else if (opt =3D=3D PR_SET_MM_ENV_START)
			mm->env_start =3D addr;
		else if (opt =3D=3D PR_SET_MM_ENV_END)
			mm->env_end =3D addr;
		break;

	/*
	 * This doesn't move auxiliary vector itself
	 * since it's pinned to mm_struct, but allow
	 * to fill vector with new values. It's up
	 * to a caller to provide sane values here
	 * otherwise user space tools which use this
	 * vector might be unhappy.
	 */
	case PR_SET_MM_AUXV: {
		unsigned long user_auxv[AT_VECTOR_SIZE];

		if (arg4 > sizeof(user_auxv))
			goto out;
		up_read(&mm->mmap_sem);

		if (copy_from_user(user_auxv, (const void __user *)addr, arg4))
			return -EFAULT;

		/* Make sure the last entry is always AT_NULL */
		user_auxv[AT_VECTOR_SIZE - 2] =3D 0;
		user_auxv[AT_VECTOR_SIZE - 1] =3D 0;

		BUILD_BUG_ON(sizeof(user_auxv) !=3D sizeof(mm->saved_auxv));

		task_lock(current);
		memcpy(mm->saved_auxv, user_auxv, arg4);
		task_unlock(current);

		return 0;
	}
	default:
		goto out;
	}

	error =3D 0;
out:
	up_read(&mm->mmap_sem);
	return error;
}

static int prctl_get_tid_address(struct task_struct *me, int __user **tid_a=
ddr)
{
	return put_user(me->clear_child_tid, tid_addr);
}

#else /* CONFIG_CHECKPOINT_RESTORE */
static int prctl_set_mm(int opt, unsigned long addr,
			unsigned long arg4, unsigned long arg5)
{
	return -EINVAL;
}
static int prctl_get_tid_address(struct task_struct *me, int __user **tid_a=
ddr)
{
	return -EINVAL;
}
#endif

SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg=
3,
		unsigned long, arg4, unsigned long, arg5)
{
	struct task_struct *me =3D current;
	unsigned char comm[sizeof(me->comm)];
	long error;

	error =3D security_task_prctl(option, arg2, arg3, arg4, arg5);
	if (error !=3D -ENOSYS)
		return error;

	error =3D 0;
	switch (option) {
		case PR_SET_PDEATHSIG:
			if (!valid_signal(arg2)) {
				error =3D -EINVAL;
				break;
			}
			me->pdeath_signal =3D arg2;
			break;
		case PR_GET_PDEATHSIG:
			error =3D put_user(me->pdeath_signal, (int __user *)arg2);
			break;
		case PR_GET_DUMPABLE:
			error =3D get_dumpable(me->mm);
			break;
		case PR_SET_DUMPABLE:
			if (arg2 < 0 || arg2 > 1) {
				error =3D -EINVAL;
				break;
			}
			set_dumpable(me->mm, arg2);
			break;

		case PR_SET_UNALIGN:
			error =3D SET_UNALIGN_CTL(me, arg2);
			break;
		case PR_GET_UNALIGN:
			error =3D GET_UNALIGN_CTL(me, arg2);
			break;
		case PR_SET_FPEMU:
			error =3D SET_FPEMU_CTL(me, arg2);
			break;
		case PR_GET_FPEMU:
			error =3D GET_FPEMU_CTL(me, arg2);
			break;
		case PR_SET_FPEXC:
			error =3D SET_FPEXC_CTL(me, arg2);
			break;
		case PR_GET_FPEXC:
			error =3D GET_FPEXC_CTL(me, arg2);
			break;
		case PR_GET_TIMING:
			error =3D PR_TIMING_STATISTICAL;
			break;
		case PR_SET_TIMING:
			if (arg2 !=3D PR_TIMING_STATISTICAL)
				error =3D -EINVAL;
			break;
		case PR_SET_NAME:
			comm[sizeof(me->comm)-1] =3D 0;
			if (strncpy_from_user(comm, (char __user *)arg2,
					      sizeof(me->comm) - 1) < 0)
				return -EFAULT;
			set_task_comm(me, comm);
			proc_comm_connector(me);
			break;
		case PR_GET_NAME:
			get_task_comm(comm, me);
			if (copy_to_user((char __user *)arg2, comm,
					 sizeof(comm)))
				return -EFAULT;
			break;
		case PR_GET_ENDIAN:
			error =3D GET_ENDIAN(me, arg2);
			break;
		case PR_SET_ENDIAN:
			error =3D SET_ENDIAN(me, arg2);
			break;
		case PR_GET_SECCOMP:
			error =3D prctl_get_seccomp();
			break;
		case PR_SET_SECCOMP:
			error =3D prctl_set_seccomp(arg2, (char __user *)arg3);
			break;
		case PR_GET_TSC:
			error =3D GET_TSC_CTL(arg2);
			break;
		case PR_SET_TSC:
			error =3D SET_TSC_CTL(arg2);
			break;
		case PR_TASK_PERF_EVENTS_DISABLE:
			error =3D perf_event_task_disable();
			break;
		case PR_TASK_PERF_EVENTS_ENABLE:
			error =3D perf_event_task_enable();
			break;
		case PR_GET_TIMERSLACK:
			error =3D current->timer_slack_ns;
			break;
		case PR_SET_TIMERSLACK:
			if (arg2 <=3D 0)
				current->timer_slack_ns =3D
					current->default_timer_slack_ns;
			else
				current->timer_slack_ns =3D arg2;
			break;
		case PR_MCE_KILL:
			if (arg4 | arg5)
				return -EINVAL;
			switch (arg2) {
			case PR_MCE_KILL_CLEAR:
				if (arg3 !=3D 0)
					return -EINVAL;
				current->flags &=3D ~PF_MCE_PROCESS;
				break;
			case PR_MCE_KILL_SET:
				current->flags |=3D PF_MCE_PROCESS;
				if (arg3 =3D=3D PR_MCE_KILL_EARLY)
					current->flags |=3D PF_MCE_EARLY;
				else if (arg3 =3D=3D PR_MCE_KILL_LATE)
					current->flags &=3D ~PF_MCE_EARLY;
				else if (arg3 =3D=3D PR_MCE_KILL_DEFAULT)
					current->flags &=3D
						~(PF_MCE_EARLY|PF_MCE_PROCESS);
				else
					return -EINVAL;
				break;
			default:
				return -EINVAL;
			}
			break;
		case PR_MCE_KILL_GET:
			if (arg2 | arg3 | arg4 | arg5)
				return -EINVAL;
			if (current->flags & PF_MCE_PROCESS)
				error =3D (current->flags & PF_MCE_EARLY) ?
					PR_MCE_KILL_EARLY : PR_MCE_KILL_LATE;
			else
				error =3D PR_MCE_KILL_DEFAULT;
			break;
		case PR_SET_MM:
			error =3D prctl_set_mm(arg2, arg3, arg4, arg5);
			break;
		case PR_GET_TID_ADDRESS:
			error =3D prctl_get_tid_address(me, (int __user **)arg2);
			break;
		case PR_SET_CHILD_SUBREAPER:
			me->signal->is_child_subreaper =3D !!arg2;
			break;
		case PR_GET_CHILD_SUBREAPER:
			error =3D put_user(me->signal->is_child_subreaper,
					 (int __user *) arg2);
			break;
		case PR_SET_NO_NEW_PRIVS:
			if (arg2 !=3D 1 || arg3 || arg4 || arg5)
				return -EINVAL;

			current->no_new_privs =3D 1;
			break;
		case PR_GET_NO_NEW_PRIVS:
			if (arg2 || arg3 || arg4 || arg5)
				return -EINVAL;
			return current->no_new_privs ? 1 : 0;
		default:
			error =3D -EINVAL;
			break;
	}
	return error;
}

SYSCALL_DEFINE3(getcpu, unsigned __user *, cpup, unsigned __user *, nodep,
		struct getcpu_cache __user *, unused)
{
	int err =3D 0;
	int cpu =3D raw_smp_processor_id();
	if (cpup)
		err |=3D put_user(cpu, cpup);
	if (nodep)
		err |=3D put_user(cpu_to_node(cpu), nodep);
	return err ? -EFAULT : 0;
}

char poweroff_cmd[POWEROFF_CMD_PATH_LEN] =3D "/sbin/poweroff";

static void argv_cleanup(struct subprocess_info *info)
{
	argv_free(info->argv);
}

static int __orderly_poweroff(void)
{
	int argc;
	char **argv;
	static char *envp[] =3D {
		"HOME=3D/",
		"PATH=3D/sbin:/bin:/usr/sbin:/usr/bin",
		NULL
	};
	int ret;

	argv =3D argv_split(GFP_ATOMIC, poweroff_cmd, &argc);
	if (argv =3D=3D NULL) {
		printk(KERN_WARNING "%s failed to allocate memory for \"%s\"\n",
		       __func__, poweroff_cmd);
		return -ENOMEM;
	}

	ret =3D call_usermodehelper_fns(argv[0], argv, envp, UMH_NO_WAIT,
				      NULL, argv_cleanup, NULL);
	if (ret =3D=3D -ENOMEM)
		argv_free(argv);

	return ret;
}

/**
 * orderly_poweroff - Trigger an orderly system poweroff
 * @force: force poweroff if command execution fails
 *
 * This may be called from any context to trigger a system shutdown.
 * If the orderly shutdown fails, it will force an immediate shutdown.
 */
int orderly_poweroff(bool force)
{
	int ret =3D __orderly_poweroff();

	if (ret && force) {
		printk(KERN_WARNING "Failed to start orderly shutdown: "
		       "forcing the issue\n");

		/*
		 * I guess this should try to kick off some daemon to sync and
		 * poweroff asap.  Or not even bother syncing if we're doing an
		 * emergency shutdown?
		 */
		emergency_sync();
		kernel_power_off();
	}

	return ret;
}
EXPORT_SYMBOL_GPL(orderly_poweroff);

--zYM0uCDKw75PZbzx--
