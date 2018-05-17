<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Player
 *
 * @ORM\Table(name="player")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\PlayerRepository")
 */
class Player
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;


    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Role")
     * @ORM\JoinColumn(nullable=false)
     */
    private $role;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Team", inversedBy="players")
     * @ORM\JoinColumn(nullable=false)
     */
    private $team;

    /**
     * @var string
     *
     * @ORM\Column(name="pseudo", type="string", length=255)
     */
    private $pseudo;

    /**
     * @var string
     *
     * @ORM\Column(name="photo_url", type="string", length=255)
     */
    private $photoUrl;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set pseudo
     *
     * @param string $pseudo
     *
     * @return Player
     */
    public function setPseudo($pseudo)
    {
        $this->pseudo = $pseudo;

        return $this;
    }

    /**
     * Get pseudo
     *
     * @return string
     */
    public function getPseudo()
    {
        return $this->pseudo;
    }

    /**
     * Set photoUrl
     *
     * @param string $photoUrl
     *
     * @return Player
     */
    public function setPhotoUrl($photoUrl)
    {
        $this->photoUrl = $photoUrl;

        return $this;
    }

    /**
     * Get photoUrl
     *
     * @return string
     */
    public function getPhotoUrl()
    {
        return $this->photoUrl;
    }

    /**
     * Set roleId
     *
     * @param \AppBundle\Entity\Role $roleId
     *
     * @return Player
     */
    public function setRoleId(\AppBundle\Entity\Role $roleId)
    {
        $this->role_id = $roleId;

        return $this;
    }

    /**
     * Get roleId
     *
     * @return \AppBundle\Entity\Role
     */
    public function getRoleId()
    {
        return $this->role_id;
    }

    /**
     * Set role
     *
     * @param \AppBundle\Entity\Role $role
     *
     * @return Player
     */
    public function setRole(\AppBundle\Entity\Role $role)
    {
        $this->role = $role;

        return $this;
    }

    /**
     * Get role
     *
     * @return \AppBundle\Entity\Role
     */
    public function getRole()
    {
        return $this->role;
    }

    /**
     * Set team.
     *
     * @param \AppBundle\Entity\Team $team
     *
     * @return Player
     */
    public function setTeam(\AppBundle\Entity\Team $team)
    {
        $this->team = $team;

        return $this;
    }

    /**
     * Get team.
     *
     * @return \AppBundle\Entity\Team
     */
    public function getTeam()
    {
        return $this->team;
    }
}
