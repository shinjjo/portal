# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class Admin(models.Model):
    member = models.ForeignKey('Member', models.DO_NOTHING, db_column='Member_ID')  # Field name made lowercase.
    admin_id = models.IntegerField(db_column='Admin_ID', primary_key=True)  # Field name made lowercase.
    admin_role = models.CharField(db_column='Admin_Role', max_length=19)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Admin'


class BelongsTo(models.Model):
    club = models.ForeignKey('Club', models.DO_NOTHING, db_column='Club_ID')  # Field name made lowercase.
    member_id = models.IntegerField(db_column='Member_ID')  # Field name made lowercase.
    join_date = models.DateField(db_column='Join_Date')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Belongs_to'
        unique_together = (('club', 'member_id'),)


class Books(models.Model):
    books_id = models.AutoField(db_column='Books_ID', primary_key=True)  # Field name made lowercase.
    venue = models.ForeignKey('Venue', models.DO_NOTHING, db_column='Venue_ID')  # Field name made lowercase.
    club = models.ForeignKey('Club', models.DO_NOTHING, db_column='Club_ID')  # Field name made lowercase.
    member = models.ForeignKey('Member', models.DO_NOTHING, db_column='Member_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Books'


class Club(models.Model):
    club_id = models.AutoField(db_column='Club_ID', primary_key=True)  # Field name made lowercase.
    club_rep = models.CharField(db_column='Club_Rep', max_length=30)  # Field name made lowercase.
    club_name = models.CharField(db_column='Club_Name', max_length=50)  # Field name made lowercase.
    club_contact = models.CharField(db_column='Club_Contact', max_length=14, blank=True, null=True)  # Field name made lowercase.
    club_email = models.CharField(db_column='Club_Email', max_length=60)  # Field name made lowercase.
    club_description = models.TextField(db_column='Club_Description', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Club'


class Enquiry(models.Model):
    enquiry_id = models.IntegerField(db_column='Enquiry_ID')  # Field name made lowercase.
    responding_club_id = models.IntegerField(db_column='Responding_Club_ID')  # Field name made lowercase.
    request_id = models.IntegerField(db_column='Request_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Enquiry'


class Event(models.Model):
    event_id = models.AutoField(db_column='Event_ID', primary_key=True)  # Field name made lowercase.
    event_title = models.CharField(db_column='Event_Title', max_length=50)  # Field name made lowercase.
    venue_id = models.IntegerField(db_column='Venue_ID')  # Field name made lowercase.
    event_date = models.DateField(db_column='Event_Date')  # Field name made lowercase.
    event_starttime = models.TimeField(db_column='Event_Starttime')  # Field name made lowercase.
    event_endtime = models.TimeField(db_column='Event_Endtime')  # Field name made lowercase.
    club_id = models.IntegerField(db_column='Club_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Event'


class ExternalRequest(models.Model):
    external_request_id = models.AutoField(db_column='External_Request_ID', primary_key=True)  # Field name made lowercase.
    club_id = models.IntegerField(db_column='Club_ID')  # Field name made lowercase.
    names = models.CharField(db_column='NAMES', max_length=55)  # Field name made lowercase.
    email = models.IntegerField(db_column='Email')  # Field name made lowercase.
    contact_number = models.CharField(db_column='Contact_Number', max_length=20)  # Field name made lowercase.
    description = models.CharField(db_column='Description', max_length=300)  # Field name made lowercase.
    surname = models.CharField(db_column='Surname', max_length=55)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'External_Request'


class GoesTo(models.Model):
    request = models.ForeignKey('Request', models.DO_NOTHING, db_column='Request_ID')  # Field name made lowercase.
    club = models.ForeignKey(Club, models.DO_NOTHING, db_column='Club_ID')  # Field name made lowercase.
    member_id = models.IntegerField(db_column='Member_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Goes_to'
        unique_together = (('request', 'club'),)


class Has(models.Model):
    clubid = models.IntegerField(db_column='ClubID')  # Field name made lowercase.
    venue_id = models.IntegerField(db_column='Venue_ID')  # Field name made lowercase.
    event_id = models.IntegerField(db_column='Event_ID')  # Field name made lowercase.
    has_id = models.IntegerField(db_column='HAS_ID', primary_key=True)  # Field name made lowercase.
    starttime = models.TimeField(db_column='Starttime')  # Field name made lowercase.
    endtime = models.TimeField(db_column='Endtime')  # Field name made lowercase.
    dayoftheweek = models.DateField(db_column='Dayoftheweek')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Has'


class HasA(models.Model):
    has_a = models.ForeignKey(Club, models.DO_NOTHING, db_column='Has_A_ID', primary_key=True)  # Field name made lowercase.
    eventid = models.IntegerField(db_column='EventID')  # Field name made lowercase.
    venue_id = models.IntegerField(db_column='Venue_ID')  # Field name made lowercase.
    club_id = models.IntegerField(db_column='Club_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Has_A'


class Holds(models.Model):
    holds_id = models.AutoField(db_column='Holds_ID', primary_key=True)  # Field name made lowercase.
    club = models.ForeignKey(Club, models.DO_NOTHING, db_column='Club_ID', unique=True)  # Field name made lowercase.
    event = models.ForeignKey(Event, models.DO_NOTHING, db_column='Event_ID', unique=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Holds'


class Isdirectedto(models.Model):
    isdirectedto_id = models.AutoField(db_column='isDirectedTo_ID', primary_key=True)  # Field name made lowercase.
    club = models.ForeignKey(Club, models.DO_NOTHING, db_column='Club_ID')  # Field name made lowercase.
    external_request = models.ForeignKey(ExternalRequest, models.DO_NOTHING, db_column='External_Request_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'IsDirectedTo'


class JoinRequest(models.Model):
    join_requst_id = models.AutoField(db_column='Join_Requst_ID', primary_key=True)  # Field name made lowercase.
    reason = models.CharField(db_column='Reason', max_length=55)  # Field name made lowercase.
    previous_experience = models.TextField(db_column='Previous_Experience')  # Field name made lowercase.
    member_id = models.IntegerField(db_column='Member_ID')  # Field name made lowercase.
    request_id = models.IntegerField(db_column='Request_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Join_Request'


class LeisureFacility(models.Model):
    venue_id = models.AutoField(db_column='Venue_ID', primary_key=True)  # Field name made lowercase.
    facility_purpose = models.CharField(db_column='Facility_Purpose', max_length=100, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Leisure_Facility'


class Login(models.Model):
    login_id = models.AutoField(db_column='Login_ID', primary_key=True)  # Field name made lowercase.
    username = models.CharField(db_column='Username', max_length=20)  # Field name made lowercase.
    password = models.CharField(db_column='Password', max_length=20)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Login'


class Make(models.Model):
    make_id = models.AutoField(db_column='Make_ID', primary_key=True)  # Field name made lowercase.
    member = models.ForeignKey('Member', models.DO_NOTHING, db_column='Member_ID')  # Field name made lowercase.
    request = models.ForeignKey('Request', models.DO_NOTHING, db_column='Request_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Make'


class Member(models.Model):
    member_id = models.AutoField(db_column='Member_ID', primary_key=True)  # Field name made lowercase.
    member_lastname = models.CharField(db_column='Member_Lastname', max_length=30)  # Field name made lowercase.
    member_firstname = models.CharField(db_column='Member_Firstname', max_length=30)  # Field name made lowercase.
    member_email = models.CharField(db_column='Member_Email', max_length=50)  # Field name made lowercase.
    member_address = models.CharField(db_column='Member_Address', max_length=100)  # Field name made lowercase.
    member_type = models.CharField(db_column='Member_Type', max_length=13)  # Field name made lowercase.
    member_mobile = models.CharField(db_column='Member_Mobile', max_length=20)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Member'


class Pays(models.Model):
    pays_id = models.AutoField(db_column='Pays_ID', primary_key=True)  # Field name made lowercase.
    member = models.ForeignKey(Member, models.DO_NOTHING, db_column='Member_ID')  # Field name made lowercase.
    club = models.ForeignKey(Club, models.DO_NOTHING, db_column='Club_ID')  # Field name made lowercase.
    subscription = models.ForeignKey('Subscription', models.DO_NOTHING, db_column='Subscription_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Pays'


class Request(models.Model):
    request_id = models.AutoField(db_column='Request_ID', primary_key=True)  # Field name made lowercase.
    member_id = models.IntegerField(db_column='Member_ID')  # Field name made lowercase.
    club_id = models.IntegerField(db_column='Club_ID')  # Field name made lowercase.
    description = models.CharField(db_column='Description', max_length=300)  # Field name made lowercase.
    request_date = models.DateField(db_column='Request_Date')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Request'


class Retrieves(models.Model):
    login = models.ForeignKey(Login, models.DO_NOTHING, db_column='Login_ID')  # Field name made lowercase.
    member_id = models.IntegerField(db_column='Member_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Retrieves'
        unique_together = (('login', 'member_id'),)


class Subscription(models.Model):
    subscription_id = models.AutoField(db_column='Subscription_ID', primary_key=True)  # Field name made lowercase.
    member_id = models.IntegerField(db_column='Member_ID')  # Field name made lowercase.
    club_id = models.IntegerField(db_column='Club_ID')  # Field name made lowercase.
    amount = models.IntegerField(db_column='Amount')  # Field name made lowercase.
    academic_year = models.IntegerField(db_column='Academic_Year')  # Field name made lowercase.
    semester = models.CharField(db_column='Semester', max_length=6)  # Field name made lowercase.
    last_payment_date = models.DateTimeField(db_column='Last_Payment_Date')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Subscription'


class Venue(models.Model):
    venue_id = models.AutoField(db_column='Venue_ID', primary_key=True)  # Field name made lowercase.
    venue_name = models.CharField(db_column='Venue_Name', max_length=30)  # Field name made lowercase.
    club_id = models.IntegerField(db_column='Club_ID')  # Field name made lowercase.
    event_id = models.IntegerField(db_column='Event_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Venue'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'
