-- upgrade-4.0.5.0.0-4.0.5.0.1.sql

SELECT acs_log__debug('/packages/intranet-audit/sql/postgresql/upgrade/upgrade-4.0.5.0.0-4.0.5.0.1.sql','');

alter table im_audits drop constraint im_audits_action_ck;
alter table im_audits add constraint im_audits_action_ck check(
      audit_action in ('after_create', 'before_update', 'after_update', 'before_nuke', 'view', 'baseline')
);
